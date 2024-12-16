import 'package:flutter/material.dart';

class VigenerePage extends StatefulWidget {
  @override
  _VigenerePageState createState() => _VigenerePageState();
}

class _VigenerePageState extends State<VigenerePage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  String _result = '';

  String vigenereEncrypt(String text, String key) {
    int keyIndex = 0;
    return text.split('').map((char) {
      if (char.toUpperCase().compareTo('A') >= 0 && char.toUpperCase().compareTo('Z') <= 0) {
        int base = char == char.toUpperCase() ? 'A'.codeUnitAt(0) : 'a'.codeUnitAt(0);
        int shift = key[keyIndex % key.length].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
        keyIndex++;
        return String.fromCharCode(base + ((char.codeUnitAt(0) - base + shift) % 26));
      } else {
        return char;
      }
    }).join();
  }

  String vigenereDecrypt(String text, String key) {
    int keyIndex = 0;
    return text.split('').map((char) {
      if (char.toUpperCase().compareTo('A') >= 0 && char.toUpperCase().compareTo('Z') <= 0) {
        int base = char == char.toUpperCase() ? 'A'.codeUnitAt(0) : 'a'.codeUnitAt(0);
        int shift = key[keyIndex % key.length].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
        keyIndex++;
        return String.fromCharCode(base + ((char.codeUnitAt(0) - base - shift + 26) % 26));
      } else {
        return char;
      }
    }).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vigenere Cipher'),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _keyController,
              decoration: InputDecoration(
                labelText: 'Enter key (word)',
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = vigenereEncrypt(_textController.text, _keyController.text);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: Text('Encrypt'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = vigenereDecrypt(_textController.text, _keyController.text);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: Text('Decrypt'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.teal.shade200),
              ),
              child: Text(
                'Result: $_result',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
