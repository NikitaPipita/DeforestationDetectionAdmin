import 'package:flutter/material.dart';

class UserDeleteButton extends StatefulWidget {
  const UserDeleteButton({
    required Function() deleteElements,
    Key? key,
  })  : _deleteElements = deleteElements,
        super(key: key);

  final Function() _deleteElements;

  @override
  UserDeleteButtonState createState() => UserDeleteButtonState();
}

class UserDeleteButtonState extends State<UserDeleteButton> {
  bool _isActive = false;

  void setActiveState(bool isActive) {
    setState(() {
      _isActive = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        'Delete',
        style: TextStyle(
          color: _isActive ? Colors.red : null,
        ),
      ),
      onPressed: _isActive ? widget._deleteElements : null,
    );
  }
}
