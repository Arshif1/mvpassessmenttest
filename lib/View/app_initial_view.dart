import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/View/sign_in_view.dart';
import 'package:mvpassessmenttest/View/sign_up_view.dart';

class AppInitialView extends StatelessWidget {
  const AppInitialView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    body: Container(   
      
        alignment: Alignment.center,
   child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.eco, size: 60, color: Colors.black),
        const SizedBox(height: 2),
        const Text(
          "MVP",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
const SizedBox(height: 32),

Padding(
  padding: EdgeInsets.symmetric(horizontal: 24),
  child: SizedBox(
    width: double.infinity,
      child:  ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
               MaterialPageRoute(
                builder: (context) => SignInView()));
          },
           child: Text('SignIn')
           )
  )
   ),
       
const SizedBox(height: 16),

   Padding(
  padding: EdgeInsets.symmetric(horizontal: 24),
  child: SizedBox(
    width: double.infinity,
      child:  ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
               MaterialPageRoute(
                builder: (context) => SignUpView()));
          },
           child: Text('SignUp')
           )
  )
   ),
      ],
    )
    )
    );
  }
}
