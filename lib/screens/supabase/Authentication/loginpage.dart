import 'package:fago/screens/supabase/Authentication/authprovider';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class loginpagescreen extends ConsumerStatefulWidget {
  const loginpagescreen({super.key});

  @override
  ConsumerState<loginpagescreen> createState() => _loginState();
}

class _loginState extends ConsumerState<loginpagescreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/login.png'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 300,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[800],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                         hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.amber[400],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordcontroller,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Please enter Password',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.amber,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                        }
                        if (value.length < 6) {
                          return 'Password must be atleast 8 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    if (authState.loading)
                      const Center(child: CircularProgressIndicator())
                    else
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            final email = _emailcontroller.text.trim();
                            final password = _passwordcontroller.text.trim();
                            final success = await ref
                                .read(authProvider.notifier)
                                .login(email, password);
                            if (success && mounted) {
                              context.go('/HomePage');
                            }
                          },
                          child: const Text('Login'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                        ),
                      ),
                    SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context.push('/signuppage');
                        },
                        child: Row( children: [  Text("Don't have an account?"),
                        SizedBox(width: 10,),
                        Text('Signup',style: TextStyle(color: Colors.orange),)
                        ])
                      ),
                    ),
                    SizedBox(height: 15),
                    if (authState.error != null)
                      Center(
                        child: Text(
                          authState.error!,
                          style: const TextStyle(color: Colors.orange),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
