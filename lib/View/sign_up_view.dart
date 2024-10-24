import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});
  @override
  State<StatefulWidget> createState() => _signUpViewState();
}

class _signUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  final TextEditingController _firstNameFieldController =
      TextEditingController();
  final TextEditingController _lastNameFieldController =
      TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();
  final TextEditingController _dobFieldController = TextEditingController();

  bool get _isAllfieldsFilled =>
      _firstNameFieldController.text.isNotEmpty &&
      _lastNameFieldController.text.isNotEmpty &&
      _emailFieldController.text.isNotEmpty &&
      _passwordFieldController.text.isNotEmpty &&
      _dobFieldController.text.isNotEmpty;

  void _navigateTodetailView(BuildContext context) {
    if (_isAllfieldsFilled) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailView(
                    userDetails: Details(
                        _firstNameFieldController.text,
                        _lastNameFieldController.text,
                        _emailFieldController.text,
                        _passwordFieldController.text,
                        _dobFieldController.text),
                  )));
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
                    controller: _firstNameFieldController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _lastNameFieldController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('12/04/2024'),
                      const SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                          print('OK');
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey, // Background color
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                          child: Text(
                            'Pick Date',
                            style: TextStyle(color: Colors.white), // Text color
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: _emailFieldController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _passwordFieldController,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
              
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      onPressed: () => _navigateTodetailView(context),
                       style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12), // Padding
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
  ),
                      child: const Text('Sign Up'))
                ],
              ),
            )));
  }
}

class DetailView extends StatelessWidget {
  DetailView({super.key, required this.userDetails});
  Details userDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(userDetails._firstName),
          SizedBox(
            height: 16,
          ),
          Text(userDetails._lastName),
          SizedBox(
            height: 16,
          ),
          Text(userDetails._email),
          SizedBox(
            height: 16,
          ),
          Text('Password: *********'),
          SizedBox(
            height: 16,
          ),
          Text(userDetails._dob),
        ],
      ),
    );
  }
}

class Details {
  final String _firstName;
  final String _lastName;
  final String _email;
  final String _password;
  final String _dob;

  Details(
      this._firstName, this._lastName, this._email, this._password, this._dob);
}
