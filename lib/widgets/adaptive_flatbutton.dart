import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdaptiveFlatButton extends StatelessWidget {
  const AdaptiveFlatButton(this.handler, this.text);

  final String text;
  final Function() handler;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                        ? CupertinoButton(
                            child: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                //color: Theme.of(context).primaryColor
                              ),
                            ),
                            onPressed: handler)
                        : ElevatedButton(
                            onPressed: handler,
                            child: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                //color: Theme.of(context).primaryColor
                              ),
                            ));
  }
}