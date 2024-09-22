import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soul_mate/AUTH/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService(); // Initialize AuthService
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text(
          'Log In',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/splash_logo-removebg-preview.png',
                    height: 400),
              ),
              const SizedBox(height: 20),
              if (_errorMessage != null)
                Text(_errorMessage!,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.3),
                        border: const OutlineInputBorder(),
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.white),
                        errorStyle:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.3),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        errorStyle:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          try {
                            User? user = await _authService.signInWithEmail(
                                _emailController.text,
                                _passwordController.text);
                            if (user != null) {
                              Navigator.pushReplacementNamed(context, '/home');
                            }
                          } catch (e) {
                            setState(() {
                              _errorMessage = e.toString();
                            });
                          }
                        }
                      },
                      child: const Text('Log In'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
