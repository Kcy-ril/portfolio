import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'atbash.dart';
import 'caesar.dart';
import 'vigenere.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF2C2E3A), // Custom background color
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Profile Picture with Border Radius
                  Container(
                    width: 150,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/cy.JPG', // Replace with your profile image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      "Hi, I'm Kim Cyril Torregoza!\n\n"
                          "I am an IT student from Davao del Norte State College and a 3rd year student. My journey as an IT student started with being simply fascinated by how technologies work and eventually turned into curiosity, which served as a driving force for me to pursue a Bachelor of Science in Information Technology (BSIT).",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Contact Section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Contact me:', style: TextStyle(color: Colors.white)),
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () {
                      // Add Facebook hyperlink logic here
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.email, color: Colors.red),
                    onPressed: () {
                      // Add Gmail hyperlink logic here
                    },
                  ),
                ],
              ),

              Divider(thickness: 1, color: Colors.white),

              // Projects Section
              Text(
                "Projects",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Project Logo 1 with Border Radius
                  Container(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/tebans.png', // First project logo
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Project Logo 2 with Border Radius
                  Container(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/java.png', // Second project logo
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              Divider(thickness: 1, color: Colors.white),

              // Project Screenshots Section with Vertical Alignment and Enlargement on Tap
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Project Screenshots",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final screenshotPaths = [
                        'assets/web1.png',
                        'assets/web2.png',
                        'assets/web3.png',
                        'assets/java1.png',
                        'assets/java2.png',
                        'assets/java3.png',
                      ];

                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    screenshotPaths[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              screenshotPaths[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Cipher navigation buttons
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AtbashPage()),
                    ),
                    child: Text('Atbash Cipher'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CaesarPage()),
                    ),
                    child: Text('Caesar Cipher'),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => VigenerePage()),
                  ),
                  child: Text('Vigenère Cipher'),
                ),
              ),


              // Logout Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  onPressed: () {
                    Provider.of<myAuthProvider>(context, listen: false).logout();
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: Text('Logout', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
