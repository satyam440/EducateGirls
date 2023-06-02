import 'package:flutter/material.dart';

class MyAlertBox extends StatefulWidget {
  const MyAlertBox({super.key});

  @override
  _MyAlertBoxState createState() => _MyAlertBoxState();
}

class _MyAlertBoxState extends State<MyAlertBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Show Alert Box'),
        onPressed: () {
          // Show the alert box popup
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text('This is an alert box popup.'),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text('Close'),
                    onPressed: () {
                      // Close the alert box popup
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
