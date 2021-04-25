import 'package:flutter/material.dart';

class SuccessOperationDialog extends StatelessWidget {
  const SuccessOperationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Icon(
            Icons.where_to_vote,
            color: Colors.green,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Operation Completed Successfully!',
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'OK',
          ),
        ),
      ],
    );
  }
}