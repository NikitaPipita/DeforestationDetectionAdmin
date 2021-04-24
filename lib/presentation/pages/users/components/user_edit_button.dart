import 'package:flutter/material.dart';

class UserEditButton extends StatefulWidget {
  const UserEditButton({
    required Function() editElement,
    Key? key,
  })  : _editElement = editElement,
        super(key: key);

  final Function() _editElement;

  @override
  UserEditButtonState createState() => UserEditButtonState();
}

class UserEditButtonState extends State<UserEditButton> {
  bool _isActive = false;

  void setActiveState(bool isActive) {
    setState(() {
      _isActive = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: const Text(
        'Edit',
      ),
      onPressed: _isActive ? widget._editElement : null,
    );
  }
}
