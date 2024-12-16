import 'package:flutter/material.dart';

class AtbashPage extends StatefulWidget {
  @override
  _AtbashPageState createState() => _AtbashPageState();
}

class _AtbashPageState extends State<AtbashPage> {
  final TextEditingController _textController = TextEditingController();
  String _result = '';

  String atbashEncryptDecrypt(String text) {
    return text.split('').map((char) {
      if (char.toUpperCase().compareTo('A') >= 0 && char.toUpperCase().compareTo('Z') <= 0) {
        int base = char == char.toUpperCase() ? 'A'.codeUnitAt(0) : 'a'.codeUnitAt(0);
        return String.fromCharCode(base + (25 - (char.codeUnitAt(0) - base)));
      } else {
        return char;
      }
    }).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atbash Cipher'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter text',
                labelStyle: TextStyle(color: Colors.deepPurple),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result = atbashEncryptDecrypt(_textController.text);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('Encrypt / Decrypt'),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.deepPurple.shade200),
              ),
              child: Text(
                'Result: $_result',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
