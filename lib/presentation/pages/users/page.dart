import 'package:deforestation_detection_admin/presentation/blocs/users/users_bloc.dart';
import 'package:deforestation_detection_admin/dependency_injection.dart' as di;
import 'package:deforestation_detection_admin/presentation/pages/users/components/user_edit_button.dart';
import 'package:deforestation_detection_admin/presentation/pages/users/components/users_delete_button.dart';
import 'package:deforestation_detection_admin/presentation/pages/users/components/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  List<bool> _tilesCheckState = <bool>[];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                onPressed: () {},
                child: const Text(
                  'Add',
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              UserEditButton(
                key: _editButtonKey,
                editElement: () {},
              ),
              const SizedBox(
                width: 15.0,
              ),
              UserDeleteButton(
                key: _deleteButtonKey,
                deleteElements: () {},
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
    );
  }
}
