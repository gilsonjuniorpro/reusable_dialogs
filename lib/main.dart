import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef void OkButtonCallback();
typedef void CancelButtonCallback();

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  void positiveAction() {
    print("The ok button was clicked");
    Fluttertoast.showToast(msg: "The ok button was clicked");
  }

  void negativeAction() {
    print("The cancel button was clicked");
    Fluttertoast.showToast(msg: "The cancel button was clicked");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Reusable Alert Dialog"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialog(
                        title: "Hello",
                        content: "This is just a test",
                        onOkButtonPressed: positiveAction,
                        onCancelButtonPressed: negativeAction,
                        buttonBackgroundColor: Colors.green,
                        buttonTextColor: Colors.yellow,
                        buttonPositiveText: "Send message",
                      );
                    },
                  );
                },
                child: const Text("Show dialog without passing actions"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final OkButtonCallback onOkButtonPressed;
  final CancelButtonCallback onCancelButtonPressed;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  final Color titleColor;
  final Color contentColor;
  final double buttonTextSize;
  final String buttonPositiveText;
  final String buttonNegativeText;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onOkButtonPressed,
    required this.onCancelButtonPressed,
    this.buttonBackgroundColor = Colors.black,
    this.buttonTextColor = Colors.white,
    this.titleColor = Colors.black,
    this.contentColor = Colors.black,
    this.buttonTextSize = 15.0,
    this.buttonPositiveText = "OK",
    this.buttonNegativeText = "Cancel",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onCancelButtonPressed();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBackgroundColor,
            textStyle: TextStyle(
              color: buttonTextColor,
              fontSize: buttonTextSize,
            ),
          ),
          child: Text(buttonNegativeText),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onOkButtonPressed();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBackgroundColor,
            textStyle: TextStyle(
              color: buttonTextColor,
              fontSize: buttonTextSize,
            ),
          ),
          child: Text(buttonPositiveText),
        ),
      ],
    );
  }
}
