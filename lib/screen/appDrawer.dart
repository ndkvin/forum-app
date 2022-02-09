import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../api/auth.dart';
import '../helpers/secureStorage.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  ListTile buttonMenu(title, path) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, path);
      },
    );
  }

  Future submitLogout() async {
    final refreshToken = await SecureStorage().getRefreshToken();
    final res = await Provider.of<Auth>(context, listen:false).requestLogout({
      'refreshToken': refreshToken,
    });
    if (res['status']) {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    Column menuList;
    var _isLogedin = context.watch<Auth>().isLogedin;

    if (_isLogedin) {
      menuList = Column(
        children: [
          buttonMenu('My Profile', '/profile'),
          ListTile(
            title: const Text('Log Out'),
            onTap: () async {
              Navigator.pop(context);
              await submitLogout();
            },
          )
        ],
      );
    } else {
      menuList = Column(
        children: [
          buttonMenu('Register', '/register'),
          buttonMenu('Login', '/login'),
        ],
      );
    }

    return Drawer(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            buttonMenu('Home', '/home'),
            menuList,
          ],
        )
      ),
    );
  }
}