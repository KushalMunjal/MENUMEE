import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_admin_panel/screens/widgets/update.dart';
import 'package:food_admin_panel/screens/widgets/notification_card_widget.dart';
import 'package:food_admin_panel/utils/app_colors.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final File image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State
{
  late File? _image;
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  final picker = ImagePicker();
  List<Product> products = [];

  Future getImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        // Notify user about the selected image
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image selected successfully'),
          ),
        );
      } else {
        print('No image selected.');
      }
    });
  }

  void saveProduct(BuildContext context) {
    if (_image == null ||
        _productNameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill out all fields and select an image.'),
        ),
      );
      return;
    }

    // Create a product object
    Product product = Product(
      name: _productNameController.text,
      description: _descriptionController.text,
      price: double.parse(_priceController.text),
      image: _image!,
    );

    // Add product to the list
    setState(() {
      products.add(product);
    });

    // Clear form fields and image
    _productNameController.clear();
    _descriptionController.clear();
    _priceController.clear();
    _image = null;

    // Notify user about successful product addition
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Product added successfully'),
      ),
    );

    // Save product details to text file
    saveProductDetailsToFile(product);

    // Navigate to the next page
    navigateToNextPage(context);
  }

  void saveProductDetailsToFile(Product product) async {
    final directory = Directory.systemTemp;
    final file = File('${directory.path}/product_details.txt');

    try {
      // Write product details to file
      await file.writeAsString(
        'Name: ${product.name}\nDescription: ${product.description}\nPrice: \$${product.price}\n\n',
        mode: FileMode.append,
      );
      print('Product details saved to file');
    } catch (e) {
      print('Error saving product details: $e');
    }
  }

  void navigateToNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateProductPage()), // Define the route to the next page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NotificationCardWidget(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _productNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter product name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Description',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Enter description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Price',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter price',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Image',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () => getImage(context),
                      child: Text('Choose Image'),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              saveProduct(context);
                            },
                            child: Text('Add Product & Next Page'),
                          ),
                          SizedBox(height: 10), // Add spacing between buttons
                          ElevatedButton(
                            onPressed: () {
                              // Handle update action
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UpdateProductPage()),
                              );
                            },
                            child: Text('Update'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AddProductPage(),
  ));
}
