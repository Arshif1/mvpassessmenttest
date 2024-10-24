import 'package:flutter/material.dart';

class UserProfileDashboardView extends StatelessWidget{
  UserDetails details = UserDetails('mohammed@gmail.com', 'Mohammed', "Mohammed Arshif", '+971 123456789');
  @override
  Widget build(BuildContext context) {
return Scaffold(
  body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
Text('Welcome ${details.firstName}', style: TextStyle(
  fontWeight: FontWeight.bold, fontSize: 32
)),
Text(details.fullName, style: TextStyle(
  fontWeight: FontWeight.bold, fontSize: 32
)),
Text(details.email, style: TextStyle(
  fontWeight: FontWeight.bold, fontSize: 32
)),
Text(details.mobile, style: TextStyle(
  fontWeight: FontWeight.bold, fontSize: 32
)),




    ],
  )
);
  }

}

class UserDetails {
  String fullName;
  String email;
  String mobile;
  String firstName;

  UserDetails(this.email, this.firstName, this.fullName, this.mobile);
}