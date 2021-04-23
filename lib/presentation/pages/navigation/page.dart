import 'package:deforestation_detection_admin/presentation/pages/users/page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const <Widget>[
    UsersList(),
    UsersList(),
    UsersList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.account_circle_outlined),
                selectedIcon: Icon(Icons.account_circle),
                label: Text('Users'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.group_work_outlined),
                selectedIcon: Icon(Icons.group_work),
                label: Text('Groups'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.wifi_tethering_outlined),
                selectedIcon: Icon(Icons.wifi_tethering),
                label: Text('IoTs'),
              ),
            ],
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
