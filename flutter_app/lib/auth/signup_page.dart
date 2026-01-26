import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/auth_button.dart';
import 'package:flutter_app/widgets/inputfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignupPage extends StatefulWidget {
  final VoidCallback onSwitch;
  const SignupPage({super.key,
    required this.onSwitch,
  });

  @override

  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    pass.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(27.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(height: 140,),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                        children: const [
                          TextSpan(text: "GetWel"),
                          TextSpan(
                            text: "+",
                            style: TextStyle(color: Color(0xFF4CAF50)),
                          ),
                        ],
                      ),
                    ),
              
                  SizedBox(height: 20,),
                  SizedBox(height: 10,),
                  Inputfield(hint_text: "Name",controller: name,),
                  SizedBox(height: 20,),
                  Inputfield(hint_text: "Email",controller: email,),
                  SizedBox(height: 20,),
                  Inputfield(hint_text: "Password",controller: pass,hidetext: true,),
                  SizedBox(height: 20,),
                  AuthButton(label: "Sign Up",onPressed: () async {
                            if (!formkey.currentState!.validate()) return;

                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: email.text.trim(),
                              password: pass.text.trim(),
                            );
                          },
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                          widget.onSwitch();
                    },
                    child: RichText(text: TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                        ),
                        children: [
                          TextSpan(text: "  Log In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4CAF50)
                            )
                          )
                                    
                        ]
                      )),
                  ),
              
              
              
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}