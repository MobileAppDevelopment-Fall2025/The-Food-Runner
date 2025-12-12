import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_food_runner/components/button.dart';
import 'package:the_food_runner/components/loading.dart';
import 'package:the_food_runner/components/textformfield.dart';
import 'package:the_food_runner/pages/register.dart';
import 'package:the_food_runner/services/authService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _auth = AuthService();
  bool _isLoading = true;

  void login() async {
    if (!_loginFormKey.currentState!.validate()) {
      return;
    }
    try {
      await _auth.authUserLogin(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      return showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: e.code == "invalid-email"
              ? const Text("Invalid Email")
              : const Text("Invalid Password"),
        ),
      );
    }
  }

  void clearInputField() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "The Food Runner".toUpperCase(),
          style: TextStyle(
            fontSize: 28,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const LoadingWidget()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Login".toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'lib/images/icon.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          MyTextFormField(
                            controller: _emailController,
                            isObscure: false,
                            label: "Email",
                          ),
                          const SizedBox(height: 16),
                          MyTextFormField(
                            controller: _passwordController,
                            isObscure: true,
                            label: "Password",
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "New User? ",
                                style: TextStyle(fontSize: 18),
                              ),
                              InkWell(
                                onTap: () => {
                                  clearInputField(),
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  )),
                                },
                                child: Text(
                                  "Register Here!",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                          MyButton(
                            title: "Login",
                            onTap: login,
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
