import 'package:voltmaster/components/my_button.dart';
import 'package:voltmaster/components/my_textfield.dart';
import 'package:voltmaster/auth/auth_services.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn(BuildContext context) async {
    //auth service
    final authService = AuthService();
    //try login
    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }
    //catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(title: Text("Incorrect Username or Password")),
      );
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
                    'Welcome back you\'ve been missed',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 25),

                  //email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  //password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),

                  //signin button
                  MyButton(
                    onTap: () => signIn(context),
                    text: 'Log In',
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  //not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member?'),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Register Now',
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
