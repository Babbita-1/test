import 'package:flutter/material.dart';
import 'package:task/app/constants/theme_constant.dart';
import 'package:task/app/shared_prefs/token_shared_prefs.dart'; // Import token_shared_prefs.dart

class Loginscreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Loginscreen({super.key});

  // Example login function
  Future<void> _login(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Check if email and password are valid, and get a token (just a simple example)
    if (email == 'test@example.com' && password == 'password123') {
      String token =
          'example_token'; // This token should come from your authentication API

      // Save the token in SharedPreferences
      await TokenSharedPrefs.saveToken(token);

      // Check if the widget is still mounted before using context
      if (!context.mounted) {
        return; // Guard against using context after async gaps
      }

      // Navigate to home or another screen
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Handle invalid login
      if (!context.mounted) {
        return; // Guard against using context after async gaps
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid credentials'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: AppTheme.formInputDecoration(
                  prefixIcon: Icons.email,
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: AppTheme.formInputDecoration(
                  prefixIcon: Icons.lock,
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                style: AppTheme.buttonStyle,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
