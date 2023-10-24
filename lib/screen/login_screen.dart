import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/provider/auth_provider.dart';
import 'package:test_flutter/provider/login_provider.dart';
import 'package:test_flutter/screen/register_screen.dart';
import 'package:test_flutter/utils/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginProvider auth = Provider.of<LoginProvider>(context, listen: false);
    AuthProvider emailLogin = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 250,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/logo.png',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Login',
                  style: blackTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          hintText: 'Masukan email',
                          hintStyle: greyTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'email tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Password',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          hintText: 'Masukan password',
                          hintStyle: greyTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forget password?',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                          onPressed: () async {
                            // auth.login(
                            //   emailController.text,
                            //   passwordController.text,
                            //   context,
                            // );email
                            emailLogin.login(emailController.text,
                                passwordController.text, context);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: whiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'OR',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                          onPressed: () {
                            auth.googleLogin();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          child: Text(
                            'Sign In With Google',
                            style: whiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Dont\'t have an account?',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const RegisterScreen();
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    final tween = Tween(
                                      begin: 0.0,
                                      end: 1.0,
                                    );
                                    return ScaleTransition(
                                      scale: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}