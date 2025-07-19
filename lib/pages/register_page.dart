import 'package:voltmaster/components/my_button.dart';
import 'package:voltmaster/components/my_textfield.dart';
import 'package:voltmaster/auth/auth_services.dart';
// import 'package:firebaseauth/firebaseauth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key,required this.onTap});
  final Function()? onTap; 

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp(BuildContext context) async {
    //Password match create a user
    final _auth=AuthService();
    if(passwordController.text==confirmPasswordController.text)
    {
      try{
      _auth.signUpWithEmailPassword(emailController.text, passwordController.text);

      }
      catch(e){
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text(e.toString()),
        ));
      }
    }
    //password dont match -> tell user to fix it
    else{
      showDialog(context: context, builder: (context)=>const AlertDialog(
          title: Text("Password doesn't match!"),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  const Icon(
                    Icons.electric_car_rounded,
                    size: 200,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //welcome back msg
                  const Text(
                    'Lets Create an account for you',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'email',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10,),
                  MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true),
                  const SizedBox(
                    height: 25,
                  ),
                  //signup button
                  MyButton(onTap: ()=>signUp(context), text: 'Sign Up'),
                  const SizedBox(
                    height: 50,
                  ),
                  //Already have an account?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
