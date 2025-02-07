import 'package:chat_app/auth/auth_services.dart';
import 'package:chat_app/screens/homeScreen.dart';
import 'package:chat_app/screens/login.dart';
import 'package:flutter/material.dart';

import '../components/my_text_field.dart';
import '../components/reusable_button.dart';


class RegisterScreen extends StatefulWidget {

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _ConfirmPasswordController=TextEditingController();
  RegisterScreen({super.key});
  void register(BuildContext context){
    final _auth=AuthServices();
    if (_passwordController.text == _ConfirmPasswordController.text){
     try{
       _auth.SignUpWithEmailAndPassword(_emailController.text.trim(), _passwordController.text.trim());
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
const Homescreen()
));
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           backgroundColor: Colors.green,
           content: Text("Account Registered Successfully!", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
           duration: const Duration(seconds: 3),
         ),
       );
     }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Creating Account Failed", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
          duration: const Duration(seconds: 3),
        ),
      );
    }
   }
   else{
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         backgroundColor: Colors.red,
         content: Text("Creating Account Failed", style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
         duration: const Duration(seconds: 3),
       ),
     );
   }
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.message, size: 60,color: Theme.of(context).colorScheme.primary,),
          const SizedBox(height: 50,),
          Text("Lets Create An Account For You!",
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
          const SizedBox(height: 10,),
          MyTextField(hintText: "Confirm Password", obscureText: true, controller: widget._ConfirmPasswordController),
          const SizedBox(height: 50,),
          MyCustomButton(
              onClick: () => widget.register(context),
              title: "Register"),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already Have An Account?", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                LoginScreen()
                ));
              },
                child: Text("Login", style: TextStyle(
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
