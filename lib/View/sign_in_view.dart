import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/View/home_view.dart';

class SignInView extends StatefulWidget {
  SignInView({super.key});

  @override
  State<StatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextField = TextEditingController();
  TextEditingController _passwordTextField = TextEditingController();

  void signIn(BuildContext context) {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        if (_areTextFieldsFilled) {
          _navigateToHomeView(context);
        }
      }
    } else {
      print('currentState = nul');
    }
  }

  bool get _areTextFieldsFilled =>
      _emailTextField.text.isNotEmpty && _passwordTextField.text.isNotEmpty;

  void _navigateToHomeView(BuildContext context) {
    if (_areTextFieldsFilled) {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) =>  HomeView()),
          (route) => false, 
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailTextField,
                        decoration: InputDecoration(label: Text('UserName')),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _passwordTextField,
                        decoration: InputDecoration(label: Text('Password')),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () => signIn(context),
                                       style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12), // Padding
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
  ),
                          child: Text('SignIn'))
                    ]))));
  }
}
