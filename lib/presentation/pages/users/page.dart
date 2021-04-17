import 'package:deforestation_detection_admin/presentation/blocs/users/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatefulWidget {
  final UsersBloc _usersBloc;

  const UsersList({
    required UsersBloc usersBloc,
    Key? key,
  })  : _usersBloc = usersBloc,
        super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<bool> _tilesCheckState = <bool>[];

  void _editElement() {}

  void _deleteElement() {}

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
              OutlinedButton(
                child: const Text(
                  'Edit',
                ),
                onPressed:
                    _tilesCheckState.contains(true) ? _editElement : null,
              ),
              const SizedBox(
                width: 15.0,
              ),
              OutlinedButton(
                child: Text(
                  'Delete',
                  style: TextStyle(
                    color: _tilesCheckState.contains(true) ? Colors.red : null,
                  ),
                ),
                onPressed:
                    _tilesCheckState.contains(true) ? _deleteElement : null,
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
          bloc: widget._usersBloc,
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
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.users!.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  value: _tilesCheckState[index],
                  onChanged: (bool? isChecked) {
                    if (isChecked != null) {
                      setState(() {
                        _tilesCheckState[index] = isChecked;
                      });
                    }
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    snapshot.users![index].email,
                  ),
                  subtitle: Text(
                    snapshot.users![index].role,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
