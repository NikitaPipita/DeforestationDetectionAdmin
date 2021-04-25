import 'package:flutter/material.dart';

class EditButton extends StatefulWidget {
  const EditButton({
    required Function() editElement,
    Key? key,
  })  : _editElement = editElement,
        super(key: key);

  final Function() _editElement;

  @override
  EditButtonState createState() => EditButtonState();
}

class EditButtonState extends State<EditButton> {
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
