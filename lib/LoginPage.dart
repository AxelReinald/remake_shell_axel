import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remake_shell_axel/src/bloc/auth_bloc/bloc/auth_bloc.dart';

import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AuthBloc? _authBloc;
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFD500),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: const Image(
                    image: AssetImage('images/shell.png'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //email
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Email cannot be blank' : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                //password
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Password',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Password cannot be blank' : null,
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is AuthLoading) {
                      const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else if (state is AuthError) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Invalid Email/Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 20))));
                      print("autherror");
                    } else if (state is AuthSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homepage()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Login Success',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 20))));
                      print("authsukses");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        final FormState? form = _formkey.currentState;
                        if (form!.validate()) {
                          print('Form is valid');
                          _authBloc!.add(LoginEvent(
                              email: email.text, password: password.text));
                          print("sign in");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.transparent,
                                  content: Text(
                                      'Email/Password tidak boleh kosong',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 15))));
                          print('Form is invalid');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
