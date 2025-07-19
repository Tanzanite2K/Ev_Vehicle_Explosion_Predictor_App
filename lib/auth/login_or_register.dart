import 'package:voltmaster/pages/login_page.dart';
import 'package:voltmaster/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget{
  const LoginOrRegister({super.key});
  @override
  State<LoginOrRegister> createState() {
    return _LoginOrRegisterState();
  }
}

class _LoginOrRegisterState extends State<LoginOrRegister>{
  //Initialy show the login screeen
  bool showLoginPage=true;
  //toggle between login and registerPage
  void togglePages(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: togglePages);
    }
    else{
      return RegisterPage(onTap: togglePages);
    }
  }
}