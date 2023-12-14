import 'package:flutter/material.dart';
import 'package:keyei/res/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: null,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              //image
              Image.asset(
                'assets/login3.png',
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome back to KEYEI',
                style: TextStyle(
                    fontSize: 20, color: dark, fontWeight: FontWeight.w100),
              ),
              const SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login ID",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        // controller: _emailController,
                        enableSuggestions: false,
                        autocorrect: false,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter email';
                        //   } else if (EmailValidator.validate(value) ==
                        //       false) {
                        //     return 'please enter a valid email';
                        //   }
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: dark,
                          hintText: "Enter your login ID",
                          hintStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w100
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0.0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 300,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
