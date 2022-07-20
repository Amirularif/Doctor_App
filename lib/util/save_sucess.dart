import 'package:flutter/material.dart';

enum DialogsAction {done, cancel}

class SaveSuccess {
  static Future<DialogsAction> doneDialog(
      BuildContext context,
      String title,
      String body,
      ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(DialogsAction.done),
              child: Text(
                'Done',
                style: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold),
              ),
            )
          ],
        );
      },);
    return (action != null) ? action : DialogsAction.cancel;
  }
}