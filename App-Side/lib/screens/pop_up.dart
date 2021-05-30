import 'package:flutter/material.dart';

Future<void> showMyDialogBox(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text('Please Fill All Fields',style: TextStyle(color: Colors.white),),
        content: Text('It is mandatory to fill all the fields to proceed. So please make sure to fill all the fields.',style: TextStyle(color: Colors.white),),
        actions: [
          FlatButton(
            textColor:Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK', style: TextStyle(fontSize: 16),),
          ),
        ],
      );
    },
  );
}
