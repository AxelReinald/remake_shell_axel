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
      backgroundColor: Colors.white,
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
                  width: 50,
                  height: 50,
                  child: const Image(
                    image: AssetImage('images/shell.png'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Welcome to Shell Asia',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 100,
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
                  height: 50,
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
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                                          color: Colors.black,
                                          fontSize: 15))));
                          print('Form is invalid');
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFD500),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Text(
                  'By continuing, I accept the\n Terms and conditions. Please refer to our \n Privacy Notice',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
