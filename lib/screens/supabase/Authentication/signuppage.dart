import 'package:fago/screens/supabase/Authentication/authprovider';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signuppage extends ConsumerStatefulWidget {
  const signuppage({super.key});

  @override
  ConsumerState<signuppage> createState() => _signuppage();
}

class _signuppage extends ConsumerState<signuppage> {
  final _formKey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSaveData();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Future<void> _loadSaveData() async {
    final prfs = await SharedPreferences.getInstance();
    setState(() {
      _passwordcontroller.text = prfs.getString('password') ?? '';
    });
  }

  Future<void> _saveData() async {
    final prfs = await SharedPreferences.getInstance();
    await prfs.setString('email', _emailcontroller.text);
    await prfs.setString('password', _passwordcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      
      body:  Column(
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
                      'Sign Up',
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
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                         hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.amber, 
                        
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
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
                        return 'Password must be atleast 6 digits';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  if (authState.loading)
              const Center(child: CircularProgressIndicator())
            else
             Center(child: ElevatedButton(
                onPressed: () async {
                  final email = _emailcontroller.text.trim();
                  final password = _passwordcontroller.text.trim();
                  final success = await ref.read(authProvider.notifier).signup(email, password);
                  if (success && mounted) {
                 
                    context.go('/loginpage');
                  }
                },
                child: const Text('SignUp'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              ),),
                             
                
                            SizedBox(height: 20),
              Center(child:  TextButton(
              onPressed: () {
                context.push('/loginpage');
              },
            child: Row( children: [  Text("Don't have an account?"),
            SizedBox(width: 10,),
                        Text('Login',style: TextStyle(color: Colors.orange),)
                        ])
            )),SizedBox(height: 15),
              if (authState.error != null)
              Center(child:
              Text(authState.error!, style: const TextStyle(color: Colors.orange))),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
