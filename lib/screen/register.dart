import 'package:flutter/material.dart';
import 'appDrawer.dart';
import '../api/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _fullnameCtrl = TextEditingController();

  bool _err = false;
  String _errMsg = '';

  Future submitRegister() async {
    final res = await Auth().requestRegister({
      'username': _usernameCtrl.text,
      'password': _passwordCtrl.text,
      'fullname': _fullnameCtrl.text,
    });

    if(res['status']) {
      print('berhasil');
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
    _fullnameCtrl.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
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
          TextFormField(
            controller: _fullnameCtrl,
            decoration: const InputDecoration(
              hintText: 'fullname',
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
              child: const Text('Register'),
              onPressed: () => submitRegister(),
            ),
          )
          ,
        ]
      ),
      drawer: const AppDrawer(),
    );
  }
}