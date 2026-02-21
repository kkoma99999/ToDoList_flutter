 import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_service.dart';
import 'package:flutter_application_1/screens/register_page.dart';
import 'package:flutter_application_1/screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // login button pressed

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // attempt login

    try {
      await authService.signInWithEmailPassword(email, password);
      
      // Navigate to home page after successful login
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  Home()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical:60 ),
        children: [
          //email
          TextField(controller: _emailController,
          decoration: const InputDecoration(labelText: "Email")),
          //password
          TextField(controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: "Password")),

          const SizedBox(height: 12,),
          //button
          ElevatedButton(onPressed: login, child: const Text("Login"),),

          //if user did not have a account already let -> sign up page
          GestureDetector(
            onTap: () => Navigator.push(context
              , MaterialPageRoute(builder: (context) => const RegisterPage()
              )),
           
             child:const Center(child: Text("Don't have an account? Sign Up")),
          )
          
        ],
      ),
    );
  }
}
