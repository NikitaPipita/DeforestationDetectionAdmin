import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/utils/validators.dart';
import 'package:flutter/material.dart';

class UserInfoDialog extends StatefulWidget {
  const UserInfoDialog({
    required Function(User) callback,
    User? user,
    Key? key,
  })  : _callback = callback,
        _user = user,
        super(key: key);

  final User? _user;
  final Function(User) _callback;

  @override
  _UserInfoDialogState createState() => _UserInfoDialogState();
}

class _UserInfoDialogState extends State<UserInfoDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  String _role = 'employee';

  final List<DropdownMenuItem<String>> _menuItems =
      const <DropdownMenuItem<String>>[
    DropdownMenuItem<String>(
      value: 'admin',
      child: Text('admin'),
    ),
    DropdownMenuItem<String>(
      value: 'manager',
      child: Text('manager'),
    ),
    DropdownMenuItem<String>(
      value: 'employee',
      child: Text('employee'),
    ),
    DropdownMenuItem<String>(
      value: 'observer',
      child: Text('observer'),
    ),
    DropdownMenuItem<String>(
      value: 'locked',
      child: Text('locked'),
    ),
  ];

  String? _passwordValidator(String? value) {
    const String passwordNotValidMessage = 'Password not valid';
    if (widget._user == null) {
      if (value == null || value.isEmpty) {
        return passwordNotValidMessage;
      }
    }
  }

  String? _fullNameValidator(String? value) {
    const String fullNameNotValidMessage = 'Full name not valid';
    if (value == null || value.isEmpty) {
      return fullNameNotValidMessage;
    }
  }

  @override
  void initState() {
    if (widget._user != null) {
      _emailController.text = widget._user!.email;
      _fullNameController.text = widget._user!.fullName;
      _role = widget._user!.role;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final User user = User(
                id: widget._user != null ? widget._user!.id : null,
                email: _emailController.text,
                password: _passwordController.text,
                role: _role,
                fullName: _fullNameController.text,
              );
              widget._callback(user);
              Navigator.pop(context);
            }
          },
          child: Text(
            widget._user == null ? 'Add' : 'Edit',
          ),
        ),
      ],
      content: Container(
        width: MediaQuery.of(context).size.width / 3,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: emailValidator,
              ),
              if (widget._user == null)
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: _passwordValidator,
                ),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  hintText: 'Full Name',
                ),
                validator: _fullNameValidator,
              ),
              DropdownButton<String>(
                items: _menuItems,
                value: _role,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _role = value;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }
}
