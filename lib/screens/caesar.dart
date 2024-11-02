import 'package:flutter/material.dart';

class CaesarPage extends StatefulWidget {
  @override
  _CaesarPageState createState() => _CaesarPageState();
}

class _CaesarPageState extends State<CaesarPage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _shiftController = TextEditingController();
  String _result = '';

  String caesarEncrypt(String text, int shift) {
    return text.split('').map((char) {
      if (char.toUpperCase().compareTo('A') >= 0 && char.toUpperCase().compareTo('Z') <= 0) {
        int base = char == char.toUpperCase() ? 'A'.codeUnitAt(0) : 'a'.codeUnitAt(0);
        return String.fromCharCode(base + ((char.codeUnitAt(0) - base + shift) % 26));
      } else {
        return char;
      }
    }).join();
  }

  String caesarDecrypt(String text, int shift) {
    return caesarEncrypt(text, 26 - shift);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caesar Cipher'),
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
              controller: _shiftController,
              decoration: InputDecoration(labelText: 'Enter shift (number)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    final shift = int.tryParse(_shiftController.text) ?? 0;
                    setState(() {
                      _result = caesarEncrypt(_textController.text, shift);
                    });
                  },
                  child: Text('Encrypt'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final shift = int.tryParse(_shiftController.text) ?? 0;
                    setState(() {
                      _result = caesarDecrypt(_textController.text, shift);
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
