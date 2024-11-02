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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = atbashEncryptDecrypt(_textController.text);
                    });
                  },
                  child: Text('Encrypt/Decrypt'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Result: $_result', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
