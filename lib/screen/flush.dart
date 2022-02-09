import 'dart:convert';

import 'package:flutter/material.dart';

void showFlushMsg(context, scafoldContext) {
  final args = ModalRoute.of(context)?.settings.arguments;
  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    if (args != null) {
      Scaffold.of(scafoldContext)
        // ignore: deprecated_member_use
        .showSnackBar(
          SnackBar(
            content: Text(args.toString()),
          )
        );
    }
  });
}