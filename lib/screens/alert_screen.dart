import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void openDialogIos(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Title'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('This is an alert dialog'),
                SizedBox(height: 20),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }

  void openDialogAndroid(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text('Alert Dialog'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('This is an alert dialog'),
              SizedBox(height: 20),
              FlutterLogo(
                size: 100,
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Show Alert',
              style: TextStyle(fontSize: 20),
            ),
          ),
          onPressed: () => Platform.isAndroid
              ? openDialogAndroid(context)
              : openDialogIos(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
