import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserProfileScreen extends StatelessWidget {

  final UserModel user;

  UserProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            CircleAvatar(
              radius: 40,
              child: Text(user.firstName[0]),
            ),

            SizedBox(height: 20),

            Text(user.firstName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(user.email),

            Text("@${user.firstName}"),
          ],
        ),
      ),
    );
  }
}
