import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo or App Name
              Center(
                child: Image.asset('assets/splash_logo-removebg-preview.png',
                    height: 300),
              ),
              const SizedBox(height: 20),

              // Sign Up Message
              const Center(
                child: Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Brief Description
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'Sign up to start connecting with like-minded individuals and discover your perfect match.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Sign Up Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.3),
                        border: const OutlineInputBorder(),
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.white),
                        errorStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Increased font size for errors
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18, // Font size for the text inside the field
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Password Field
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.3),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        errorStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Confirm Password Field
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.3),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        errorStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
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

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.pushNamed(context, '/login');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // "Already have an account? Log In" with different styles
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
