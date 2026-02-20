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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password don't match")));
      return;
    }
      try{
          await authService.signUpWithEmailPassword(email, password);


          Navigator.pop(context);

      }catch(e){
        if(mounted){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
      return;
        }
      }
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text("Sign Up"),),
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

                      //confirm password
          TextField(controller: _confirmPasswordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: "Confirm Password")),

          const SizedBox(height: 12,),
          //button
          ElevatedButton(onPressed: signUp, child: const Text("Sign Up"),),

      const SizedBox(height: 12,),
          //if user already has an account -> go back to login page
          GestureDetector(
            onTap: () => Navigator.pop(context),
           
             child:const Center(child: Text("Already have an account? Sign In")),
          )
          
        ],
      ),
    );
  }
}