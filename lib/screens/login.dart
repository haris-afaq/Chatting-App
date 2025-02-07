import 'package:chat_app/auth/auth_services.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/components/reusable_button.dart';
import 'package:chat_app/screens/register.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  LoginScreen({super.key});

  void login(BuildContext context)async{
    final authService= AuthServices();
    try{
      await authService.SignInWithEmailAndPassword(_emailController.text.trim(), _passwordController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Account Logged in Successfully ", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
          duration: const Duration(seconds: 3),
        ),
      );
    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Login Failed", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.message, size: 60,color: Theme.of(context).colorScheme.primary,),
            const SizedBox(height: 50,),
            Text("Welcome Back You've Been Missed!",
           style: TextStyle(
             color: Theme.of(context).colorScheme.primary,
             fontSize: 16,
           ),
           ),
            const SizedBox(height: 25,),
            MyTextField(hintText: "Email",
              obscureText: false,controller: widget._emailController,),
            const SizedBox(height: 10,),
            MyTextField(hintText: "Password", obscureText: true,
                controller: widget._passwordController),

            const SizedBox(height: 50,),
            MyCustomButton(
              onClick: () => widget.login(context),
              title: "Login",
            ),

            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Doesn't Have An Account?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                  RegisterScreen()
                  ));
                },
                    child: Text("Register Now", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
