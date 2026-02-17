import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

    final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void signUp() async{
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // check if the confirm matchs the orignal password

    if (password != confirmPassword){
      
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}