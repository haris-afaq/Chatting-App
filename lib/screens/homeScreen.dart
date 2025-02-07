import 'package:chat_app/auth/auth_services.dart';
import 'package:chat_app/chat-services/chat_services.dart';
import 'package:chat_app/components/my_drawer.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  final AuthServices _authServices=AuthServices();
  final ChatServices _chatServices=ChatServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child:  Text("Home Screen")),
      ),
      drawer: const MyDrawer(),

      body: _buildUserList(),
    );
  }

  Widget _buildUserList(){
    return StreamBuilder(stream: _chatServices.getUserStream(),
        builder: (context, snapshot){
if(snapshot.hasError){
  return const Text("Error");
}
else if(snapshot.connectionState==ConnectionState.waiting){
  return const Center(child: CircularProgressIndicator());
}
else{
  return ListView(
children:[
  snapshot.data!.map<Widget>((userData)=>_buildUserList().toList())
]
  );
}


        });
  }

  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){

  }
}
