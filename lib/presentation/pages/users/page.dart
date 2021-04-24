import 'package:deforestation_detection_admin/domain/entities/user.dart';
import 'package:deforestation_detection_admin/presentation/blocs/users/users_bloc.dart';
import 'package:deforestation_detection_admin/dependency_injection.dart' as di;
import 'package:deforestation_detection_admin/presentation/pages/users/components/user_edit_button.dart';
import 'package:deforestation_detection_admin/presentation/pages/users/components/users_delete_button.dart';
import 'package:deforestation_detection_admin/presentation/pages/users/components/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/user_info_dialog.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final UsersBloc _usersBloc = di.sl.get();

  final GlobalKey<UserEditButtonState> _editButtonKey =
      GlobalKey<UserEditButtonState>();
  final GlobalKey<UserDeleteButtonState> _deleteButtonKey =
      GlobalKey<UserDeleteButtonState>();
  List<User> _users = <User>[];
  List<bool> _tilesCheckState = <bool>[];

  void _addUserDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return UserInfoDialog(
          callback: (User user) {
            _editButtonKey.currentState!.setActiveState(false);
            _deleteButtonKey.currentState!.setActiveState(false);
            _usersBloc.add(UsersBlocEvent.createUser(user));
          },
        );
      },
    );
  }

  void _editUserDialog() {
    User? user;
    for (int i = 0; i < _tilesCheckState.length; i++) {
      if (_tilesCheckState[i]) {
        user = _users[i];
        break;
      }
    }
    if (user != null) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return UserInfoDialog(
            user: user,
            callback: (User user) {
              _editButtonKey.currentState!.setActiveState(false);
              _deleteButtonKey.currentState!.setActiveState(false);
              _usersBloc.add(UsersBlocEvent.updateUser(user));
            },
          );
        },
      );
    }
  }

  void _deleteUsers() {
    final List<int> ids = <int>[];
    for (int i = 0; i < _tilesCheckState.length; i++) {
      if (_tilesCheckState[i]) {
        ids.add(_users[i].id!);
      }
    }
    if (ids.isNotEmpty) {
      _editButtonKey.currentState!.setActiveState(false);
      _deleteButtonKey.currentState!.setActiveState(false);
      _usersBloc.add(UsersBlocEvent.deleteUsers(ids));
    }
  }

  void _loadUsers() {
    _usersBloc.add(const UsersBlocEvent.getUsers());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersBlocState>(
      bloc: _usersBloc,
      listener: (BuildContext context, UsersBlocState snapshot) {
        if (snapshot.status == UsersBlocStatus.OperationSuccess) {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
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
            },
          );
        }
      },
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white54,
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 20.0,
              bottom: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                OutlinedButton(
                  onPressed: _addUserDialog,
                  child: const Text(
                    'Add',
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                UserEditButton(
                  key: _editButtonKey,
                  editElement: _editUserDialog,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                UserDeleteButton(
                  key: _deleteButtonKey,
                  deleteElements: _deleteUsers,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.update,
                  ),
                  onPressed: _loadUsers,
                ),
              ],
            ),
          ),
          Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.grey,
          ),
          BlocBuilder<UsersBloc, UsersBlocState>(
            bloc: _usersBloc,
            builder: (BuildContext context, UsersBlocState snapshot) {
              if (snapshot.status == UsersBlocStatus.Error) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              } else if (snapshot.status == UsersBlocStatus.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              _users = snapshot.users!;
              _tilesCheckState = List<bool>.generate(
                  snapshot.users!.length, (int index) => false);
              return UsersList(
                usersInfo: snapshot.users!,
                tilesCheckState: _tilesCheckState,
                tileCheckCallback: (int index, bool isChecked) {
                  _tilesCheckState[index] = isChecked;
                  if (_tilesCheckState.contains(true)) {
                    _editButtonKey.currentState!.setActiveState(true);
                    _deleteButtonKey.currentState!.setActiveState(true);
                  } else {
                    _editButtonKey.currentState!.setActiveState(false);
                    _deleteButtonKey.currentState!.setActiveState(false);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
