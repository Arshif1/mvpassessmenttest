import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/ViewModel/add_payment_view_model.dart';
import 'package:mvpassessmenttest/ViewModel/cart_view_model.dart';
import 'package:mvpassessmenttest/ViewModel/checkout_view_model.dart';
import 'package:mvpassessmenttest/ViewModel/shipping_address_add_view_model.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:mvpassessmenttest/View/app_initial_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => CheckoutViewModel()),
            ChangeNotifierProvider(
              create: (_) => ShippingAddressAddViewModel()),
              ChangeNotifierProvider(
              create: (_) => AddPaymentViewModel())
      ],
      child: const MainApp(),
      ),
    );
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eCommerce MVP',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white, // Set background to black
          selectedItemColor: Colors.amber, // Selected icon/text color
          unselectedItemColor: Colors.grey, // Unselected icon/text color
          showUnselectedLabels: true, // Show unselected labels
        ),
      ),
      
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController circleController;
  late AnimationController logoController;
  late Animation<double> circleAnimation;
  late Animation<double> bounceAnimation;
  late Animation<double> fadeAnimation;

  bool showLogo = false;

  @override
  void initState() {
    circleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    circleAnimation = Tween<double>(begin: 0, end: 2.0).animate(
      CurvedAnimation(parent: circleController, curve: Curves.easeInOut),
    );

    circleController.forward().whenComplete(() {
      setState(() {
        showLogo = true; // Display logo when the circle is off-screen.
      });
      logoController.forward();
    });

    logoController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    bounceAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Curves.elasticOut, // Provides the bounce effect.
      ),
    );

    fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: logoController,
        curve: Interval(0.8, 1.0, curve: Curves.easeOut),
      ),
    );

    logoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AppInitialView()),
        );
      }
    });
  }

@override
void dispose() {
  circleController.dispose();
  logoController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AnimatedBuilder(
              animation: circleController,
              builder: (context, child) {
                return showLogo
                    ? AnimatedBuilder(
                        animation: logoController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: fadeAnimation.value,
                            child: Transform.scale(
                              scale: bounceAnimation.value,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.eco,
                                      size: 60, color: Colors.black),
                                  SizedBox(height: 6),
                                  Text(
                                    "MVP",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : AnimatedBuilder(
                        animation: circleController,
                        builder: (context, child) {
                          return CustomPaint(
                            size: Size(size.width,
                                size.width), // Set the size of the custom paint
                            painter: WavyCirclePainter(
                              animationValue: circleAnimation.value,
                            ),
                          );
                        },
                      );
              }),
        ));
  }
}


class WavyCirclePainter extends CustomPainter {
  final double animationValue;

  WavyCirclePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.75;

    double radius = (size.width / 2) * animationValue;

    Path path = Path();
    double waveHeight = 7.0; // Height of the wave
    double waveLength = 40.0; // Length of one wave

    for (double i = 0; i <= 360; i += 1) {
      double x = radius * cos(i * pi / 180);
      double y = radius * sin(i * pi / 180) +
          waveHeight * sin((i / waveLength + animationValue * 10) * pi);
      if (i == 0) {
        path.moveTo(size.width / 2 + x, size.height / 2 + y);
      } else {
        path.lineTo(size.width / 2 + x, size.height / 2 + y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavyCirclePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
