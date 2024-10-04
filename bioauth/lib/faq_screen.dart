import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text('Frequently Asked Questions (FAQs)'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildQuestionAnswer(
              'What is BioAuth Attendance System?',
              'BioAuth is an advanced attendance system designed for undergraduate students at LASU. It uses face recognition and geofencing technology to accurately track attendance in classrooms.',
            ),
            _buildQuestionAnswer(
              'How do I sign up?',
              'Tap on the "SIGN UP" button on the main screen. You will be asked to provide your personal details, matric number, and upload a passport photo with a white background.',
            ),_buildQuestionAnswer(
              'Why do I need to upload a passport photo?',
              'Your passport photo is used to create your facial recognition profile. This allows the system to accurately identify you during attendance marking.',
            ),
            _buildQuestionAnswer(
              'What is geofencing?',
              'Geofencing creates a virtual boundary around a specific location, like your classroom. You need to be within this boundary for your attendance to be marked.',
            ),
            _buildQuestionAnswer(
              'How does face recognition work?',
              'When you attend a class, the app will use your device\'s camera to capture your face. It then compares this image to your registered facial profile for verification.',
            ),
            _buildQuestionAnswer(
              'What if my face isn\'t recognized?',
              'Ensure you are in a well-lit area and your face is clearly visible to the camera. If the issue persists, contact your course instructor or technical support.',
            ),
            _buildQuestionAnswer(
              'Can I use the app on multiple devices?',
              'Currently, your account is linked to a single device. Using multiple devices might lead to attendance discrepancies.',),
            _buildQuestionAnswer(
              'What if I forget my password?',
              'On the sign-in screen, tap on "Forgot Password" and follow the instructions to reset your password via your registered email.',
            ),
            _buildQuestionAnswer(
              'How do I check my attendance records?',
              'Navigate to the "Reports" or "Attendance History" section within the app to view your detailed attendance history.',
            ),
            _buildQuestionAnswer(
              'Is my attendance data secure?',
              'Yes, your attendance data is securely stored on our servers and only accessible to authorized personnel, such as your instructors and administrators.',
            ),
            _buildQuestionAnswer(
              'What if I have technical issues with the app?',
              'Reach out to our technical support team through the "Help & Support" section in the app, or email us at bioauth.support@lasu.edu.ng.',
            ),
            _buildQuestionAnswer(
              'Can I use the app offline?',
              'Some features, like viewing past attendance records, might be available offline. However, face recognition and geofencing require an active internet connection.',
            ),
            _buildQuestionAnswer(
              'How often is my attendance recorded?',
              'Attendance is recorded each time you mark your presence in a class within the geofenced area and the attendance session is active.',
            ),
            _buildQuestionAnswer(
              'Will I be notified about my attendance?',
              'Yes, you will receive real-time notifications confirming your attendance status for each class.',
            ),
            _buildQuestionAnswer(
              'Can I edit my attendance records?',
              'No, attendance records are automatically generated and cannot be manually edited by students. If you believe there is an error, contact your instructor.',
            ),
            _buildQuestionAnswer(
              'What if I am late to class?',
              'Your attendance might be marked as late if you arrive after the designated start time. Check with your instructor for their late attendance policy.',
            ),
            _buildQuestionAnswer(
              'Do I need to keep the app open during class?',
              'You need to open the app and mark your attendance when prompted. You can then minimize the app and continue with your class.',
            ),
            _buildQuestionAnswer(
              'How does the app benefit me?',
              'BioAuth simplifies attendance tracking, eliminates manual errors, and provides real-time feedback on your attendance status, helping you stay on top of your academic progress.',
            ),
            _buildQuestionAnswer(
              'What happens if my phone battery dies during class?',
              'If your phone battery dies and you haven\'t marked your attendance, inform your instructor after class to manually mark your presence.',
            ),
            _buildQuestionAnswer(
              'Can I see the attendance of other students?',
              'No, for privacy reasons, you can only view your own attendance records.',
            ),
          ],
        ),
      ),
    ),
  );
  }

  Widget _buildQuestionAnswer(String question, String answer) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              answer,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}