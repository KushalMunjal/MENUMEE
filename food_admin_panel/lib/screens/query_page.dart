import 'dart:io';
import 'package:flutter/material.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  TextEditingController _queryController = TextEditingController();
  TextEditingController _answerController = TextEditingController();
  List<Query> queries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Query Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _queryController,
              decoration: InputDecoration(
                labelText: 'Ask your query',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _submitQuery();
              },
              child: Text('Submit Query'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: queries.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Question: ${queries[index].question}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Answer: ${queries[index].answer}'),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            _replyToQuery(index);
                          },
                          child: Text('Reply'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitQuery() {
    setState(() {
      final newQuery = Query(
        question: _queryController.text,
        answer: '',
        replies: [],
      );
      queries.add(newQuery);
      _queryController.clear();
      _showNotification('Query submitted!');
    });
  }

  void _replyToQuery(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reply to Query'),
          content: TextField(
            controller: _answerController,
            decoration: InputDecoration(
              labelText: 'Your reply',
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  queries[index].replies.add(_answerController.text);
                  _answerController.clear();
                  Navigator.of(context).pop();
                });
              },
              child: Text('Submit Reply'),
            ),
          ],
        );
      },
    );
  }

  void _showNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Save queries to a text file
  void _saveQueriesToFile() async {
    final file = File('queries.txt');
    final content = queries.map((query) => '${query.question}: ${query.answer}\n').join();
    await file.writeAsString(content);
  }
}

class Query {
  final String question;
  final String answer;
  final List<String> replies;

  Query({required this.question, required this.answer, required this.replies});
}
