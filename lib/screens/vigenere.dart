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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
            TextField(
              controller: _keyController,
              decoration: InputDecoration(labelText: 'Enter key (word)'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = vigenereEncrypt(_textController.text, _keyController.text);
                    });
                  },
                  child: Text('Encrypt'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = vigenereDecrypt(_textController.text, _keyController.text);
                    });
                  },
                  child: Text('Decrypt'),
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
