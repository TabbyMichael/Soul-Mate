import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart'; // Import your AuthService

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  // Create an instance of AuthService
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/splash_logo-removebg-preview.png',
                    height: 300),
              ),
              const SizedBox(height: 20),
              const Text('Create Your Account',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
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
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.3),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        errorStyle:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.3),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        errorStyle:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          try {
                            User? user = await _authService.signUpWithEmail(
                                _emailController.text,
                                _passwordController.text);
                            if (user != null) {
                              Navigator.pushNamed(context, '/login');
                            } else {
                              setState(() {
                                _errorMessage =
                                    'Failed to sign up. Please try again.';
                              });
                            }
                          } catch (e) {
                            setState(() {
                              _errorMessage = 'Error: ${e.toString()}';
                              print('Sign-up error: $e'); // Log the error
                            });
                          }
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('Already have an account? Log In',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
