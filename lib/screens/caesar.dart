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
        centerTitle: true,
        backgroundColor: Colors.indigo,
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
                labelStyle: TextStyle(color: Colors.indigo),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _shiftController,
              decoration: InputDecoration(
                labelText: 'Enter shift (number)',
                labelStyle: TextStyle(color: Colors.indigo),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final shift = int.tryParse(_shiftController.text) ?? 0;
                    setState(() {
                      _result = caesarEncrypt(_textController.text, shift);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: Text('Encrypt'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final shift = int.tryParse(_shiftController.text) ?? 0;
                    setState(() {
                      _result = caesarDecrypt(_textController.text, shift);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.indigo.shade200),
              ),
              child: Text(
                'Result: $_result',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.indigo.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
