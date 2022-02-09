import 'package:flutter/material.dart';
import 'appDrawer.dart';
import 'flush.dart';
import '../api/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _err = false;
  String _errMsg = '';

  Future submitLogin() async {
    final res = await Provider.of<Auth>(context, listen:false).requestLogin({
      'username': _usernameCtrl.text,
      'password': _passwordCtrl.text,
    });

    if(res['status']) {
      Navigator.pushNamed(context, '/profile', arguments: { 'msg': 'Login Success' });
    } else {
      final errMsg = res['errMsg']['message'];
      setState(() {
        _err = true;
        _errMsg = errMsg;
      });
    }
  }

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Builder(
        builder: (scafoldContext) {
          showFlushMsg(context, scafoldContext);
          return Column(
            children: [
              TextFormField(
                controller: _usernameCtrl,
                decoration: const InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: _passwordCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              Visibility(
                child: Text('$_errMsg'),
                visible: _err,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  child: const Text('Login'),
                  onPressed: () => submitLogin(),
                ),
              )
              ,
            ]
          );
        },
      ), 
      drawer: const AppDrawer(),
    );
  }

  
}