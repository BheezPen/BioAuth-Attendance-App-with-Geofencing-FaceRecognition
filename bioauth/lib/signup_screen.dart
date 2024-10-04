import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart'; // Make sure you have your HomePage file imported
import 'package:dropdown_button2/dropdown_button2.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.purpleAccent,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 25),
    textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  final _formKey = GlobalKey<FormState>();bool _isSubmitEnabled = false;

  File? _image;
  final picker = ImagePicker();
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _otherNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _matricNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  final _facultyController = TextEditingController();
  final _departmentController = TextEditingController();
  String? _selectedCampus;
  String? _selectedProgram;
  final _programController = TextEditingController();

  final List<String> _campuses = ['Epe Campus', 'Ikeja Campus', 'Ojo Campus'];

  final List<String> _programs = [ // Add this list
    'BSc',
    'BEd',
    'MSc','PhD',
    'Diploma',
    'Predegree',
    'JUPEP',
    'Part Time',
    'Sandwich',
  ];

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _submitSignUpForm() async {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      try {
        // Create user in Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _emailController.text.trim(), // Get trimmed email
            password: _passwordController.text.trim()); // Get trimmed password);

            // Store user data in Firestore if user creation is successful
            if (userCredential.user != null) {

          try {
            // Add user data to Firestore
            await FirebaseFirestore.instance
                .collection('students') // Select the 'students' collection
                .doc(userCredential.user!.uid) // Use user UID as document ID
                .set({
              'firstName': _firstNameController.text.trim(),
              'lastName': _lastNameController.text.trim(),
              'otherName': _otherNameController.text.trim(),'matricNumber': _matricNumberController.text.trim(),
              'email': _emailController.text.trim(),
              'profileImageUrl': '', // Handle image upload if needed
              'faculty': _facultyController.text.trim(),
              'department': _departmentController.text.trim(),
              'campus': _selectedCampus,
              'program': _programController.text.trim(),
            },
              // Show success dialog
              await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor:
                  Colors.green[50], // Green background for success
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Rounded corners
                  ),
                  title: Column(
                    children: [
                      Icon(Icons.check_circle_outline,
                          color: Colors.green, size: 40), // Success icon
                      SizedBox(height: 10), // Spacing
                      Text(
                        "SignUp Successful", // Dialog title
                        textAlign: TextAlign.center, // Centered text
                        style: TextStyle(
                          color: Colors.green, // Green text
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                    ],
                  ),
                  content: Text(
                    "Your account has been created!", // Dialog message
                    textAlign: TextAlign.center, // Centeredtext
                    style: TextStyle(color: Colors.green), // Green text
                  ),
                  actions: [
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.green, // Green background for button
                          foregroundColor: Colors.white, // White text
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          // Close dialog and navigate to HomePage
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text("OK"), // Button text
                      ),
                    ),
                    SizedBox(height: 10), // Spacing
                  ],
                );
              },
            )


            );

            // Print success message to console
            print('Account successfully created for ${_emailController.text.trim()}');
          } catch (firestoreError) {
            // Print Firestore error to console
            print('Firestore Error: $firestoreError');
            // Show Firestore error dialog
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.red[50], // Red background for error
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Rounded corners
                  ),
                  title: Column(
                    children: [
                      Icon(Icons.error_outline,
                          color: Colors.red, size: 40), // Error icon
                      SizedBox(height: 10), // Spacing
                      Text(
                        "Firestore Error", // Dialog title
                        textAlign: TextAlign.center, // Centered text
                        style: TextStyle(
                          color: Colors.red, // Red text
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                    ],
                  ),
                  content: Text(
                    "An error occurred while saving data. Please try again.", // Dialog message
                    textAlign: TextAlign.center, // Centered text
                    style: TextStyle(color: Colors.red), // Red text
                  ),
                  actions: [
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .red, // Red background for button
                          foregroundColor: Colors.white, // White text
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                          ),
                        ),
                        onPressed: () => Navigator.of(context)
                            .pop(), // Close dialog on button press
                        child: Text("OK"), // Button text
                      ),
                    ),
                    SizedBox(height: 10), // Spacing
                  ],
                );
              },
            );
          }
        }


      } on FirebaseAuthException catch (e) {
        // Handle Firebase Authentication exceptions
        String errorMessage = "An error occurred. Please try again.";
        if (e.code == 'weak-password') {
          errorMessage = 'Password must be at least 6 characters long.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'An account already exists for that email.';
        } else {
          print('Firebase Exception: ${e.code} - ${e.message}');
        }

        // Show error dialog for authentication errors
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.red[50], // Red background for error
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
              ),
              title: Column(
                children: [
                  Icon(Icons.error_outline,
                      color: Colors.red, size: 40), // Error icon
                  SizedBox(height: 10), // Spacing
                  Text(
                    "Sign Up Error", // Dialog title
                    textAlign: TextAlign.center, // Centered text
                    style: TextStyle(
                      color: Colors.red, // Red text
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                ],
              ),content: Text(
              errorMessage, // Dialog message
              textAlign: TextAlign.center, // Centered text
              style: TextStyle(color: Colors.red), // Red text
            ),
              actions: [
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Red background for button
                      foregroundColor: Colors.white, // White text
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                      ),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pop(), // Close dialog on button press
                    child: Text("OK"), // Button text
                  ),
                ),
                SizedBox(height: 10), // Spacing
              ],
            );
          },
        );
      } catch (e) {
        // Handle general exceptions during signup
        print('General Exception during signup: $e');
        // Show error dialog for general exceptions
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // ... (Error dialog content for general exceptions)
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.purple,
        elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonStyle,
    ),
    ),
    home: Scaffold(
    backgroundColor: Colors.purple[100],
    body: Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
    child: Form(
    key: _formKey,
    onChanged: () {
    setState(() {
    _isSubmitEnabled = _formKey.currentState!.validate();
    });
    },
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    SizedBox(height: 50),
    SizedBox(
    height: 80,
    width: 80,
    child: Image.asset(
    'assets/lasu_logo.png'), // Replace with your actual asset path
    ),
    SizedBox(height: 20),
    Text(
    'BioAuth Attendance System',
    style: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.purple[600],
    ),
    ),
    SizedBox(height: 50),
    Center(
    child: _image == null
    ? Text('No image selected.',
    style: TextStyle(color: Colors.red))
        : Image.file(_image!, height: 150),
    ),
    ElevatedButton(
    onPressed: getImage,
    child: Text('Upload Passport\n(White Background)', textAlign: TextAlign.center)
    ),
    SizedBox(height: 20),Text(
    'Please upload a passport photo with a white background.',
    style: TextStyle(color: Colors.red),
    ),

      SizedBox(height: 30),
      TextFormField(
        controller: _lastNameController,
        decoration: InputDecoration(labelText: 'Last Name',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your last name';
          }
          return null;
        },
      ),
      SizedBox(height: 40),
      TextFormField(
        controller: _firstNameController,
        decoration: InputDecoration(
          labelText: 'First Name',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your first name';
          }
          return null;
        },
      ),
      SizedBox(height: 40),
      TextFormField(
        controller: _otherNameController,
        decoration: InputDecoration(
          labelText: 'Other Name',
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 40),
      TextFormField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
      SizedBox(height: 40),
      TextFormField(
        controller: _matricNumberController,
        decoration: InputDecoration(
          labelText: 'Matric Number',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your matric number';
          }
          return null;
        },
      ),
      SizedBox(height: 40),
      TextFormField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
      SizedBox(height: 40),
      TextFormField(
        controller: _facultyController,
        decoration: InputDecoration(
          labelText: 'Faculty',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your faculty';
          }
          return null;
        },
      ),
      SizedBox(height: 40),
      TextFormField(
        controller: _departmentController,
        decoration: InputDecoration(
          labelText: 'Department',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your department';
          }
          return null;
        },
      ),











      SizedBox(height: 40),
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Campus',
          border: OutlineInputBorder(),
        ),
        value: _selectedCampus,
        onChanged: (newValue) {
          setState(() {
            _selectedCampus = newValue;
          });
        },
        items: _campuses.map((campus) {
          return DropdownMenuItem(
            value: campus,
            child: Text(
              campus,
              style: TextStyle(
                fontWeight: FontWeight.bold, // Make text bold
              ),
            ),
          );
        }).toList(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your campus';
          }
          return null;
        },
      ),

      // Do the same for the Program dropdown




      SizedBox(height: 40),
      DropdownButtonFormField<String>( // Add this Dropdown
        decoration: InputDecoration(
          labelText: 'Program',
          border: OutlineInputBorder(),
        ),
        value: _selectedProgram,
        onChanged: (newValue) {
          setState(() {
            _selectedProgram = newValue;
          });
        },
        items: _programs.map((program) {
          return DropdownMenuItem(
            value: program,
            child: Text(
              program,
              style: TextStyle(
                fontWeight: FontWeight.bold, // Make text bold
              ),
            ),
          );
        }).toList(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your program';
          }
          return null;
        },
      ),


      SizedBox(height: 50),
      ElevatedButton(
        onPressed: _isSubmitEnabled ? _submitSignUpForm : null,
        child: Text('SUBMIT'),
      ),
    ],
    ),
    ),),
    ),
    ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers
    _lastNameController.dispose();
    _firstNameController.dispose();
    _otherNameController.dispose();
    _emailController.dispose();
    _matricNumberController.dispose();
    _passwordController.dispose();
    _facultyController.dispose();
    _departmentController.dispose();
    _programController.dispose();
    super.dispose();
  }
}