import 'package:flutter/material.dart';
import 'package:keyei/home.dart';
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
                'Welcome back to Key Insights',
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
                      height: 5,
                    ),
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: TextFormField(
                        enableSuggestions: false,
                        autocorrect: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your login ID';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter login ID",
                          hintStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.black26,
                              fontWeight: FontWeight.w100),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 8),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 10.0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: ElevatedButton(
                        // onPressed: () => handleLogin(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          shadowColor: Colors.grey.withOpacity(0.9),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
