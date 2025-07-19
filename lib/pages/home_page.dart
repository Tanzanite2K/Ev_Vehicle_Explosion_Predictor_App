import 'package:flutter/material.dart';
import 'package:voltmaster/components/my_drawer.dart';
import 'package:voltmaster/auth/auth_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    //get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout)),
        ],
        title: const Center(
          child: Text("Home Page"),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
