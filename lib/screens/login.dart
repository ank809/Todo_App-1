import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/auth.dart';

import '../controllers/todo_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login page',
        ),
        backgroundColor: Color.fromARGB(255, 77, 182, 172),
      ),
      drawer: const Drawer(
        shadowColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/images/login_image.png"),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle:
                              TextStyle(color: Colors.black87, fontSize: 25),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 20.0, right: 10.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle:
                              TextStyle(color: Colors.black87, fontSize: 25),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (states) => Color.fromARGB(255, 92, 147, 241),
                            ),
                          ),
                          onPressed: () async {
                            bool loginSuccess = await loginUser(
                                emailController.text, passwordController.text);
                            if (loginSuccess) {
                              print('Login successful');
                              Provider.of<TodoProvider>(context, listen: false)
                                  .readtodos();
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Invalid Username and Password'),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/SignUp');
                          },
                          child: const Text(
                            'Sign Up',
                            style:
                                TextStyle(fontSize: 23.0, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.6,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const Text(
                      '-or login with-',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 38.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            print('google icon pressed');
                          },
                          child: Image.asset(
                            'assets/images/google.png',
                            width: 42.0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('facebook icon pressed');
                          },
                          child: Image.asset(
                            'assets/images/facebook.png',
                            width: 42.0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('github icon pressed');
                          },
                          child: Image.asset(
                            'assets/images/github.png',
                            width: 42.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
