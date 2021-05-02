import 'package:deforestation_detection_admin/presentation/pages/dumps/page.dart';
import 'package:deforestation_detection_admin/presentation/pages/groups/page.dart';
import 'package:deforestation_detection_admin/presentation/pages/iots/page.dart';
import 'package:deforestation_detection_admin/presentation/pages/users/page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    UsersPage(),
    GroupsPage(),
    IotsPage(),
    DumpsPage(),
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
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: const Icon(Icons.account_circle_outlined),
                selectedIcon: const Icon(Icons.account_circle),
                label: Text('users'.tr()),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.group_work_outlined),
                selectedIcon: const Icon(Icons.group_work),
                label: Text('groups'.tr()),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.wifi_tethering_outlined),
                selectedIcon: const Icon(Icons.wifi_tethering),
                label: Text('iots'.tr()),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.storage_outlined),
                selectedIcon: const Icon(Icons.storage),
                label: Text('dumps'.tr()),
              ),
            ],
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    context.setLocale(const Locale('en'));
                  },
                  child: const Text(
                    'ENG',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () {
                    context.setLocale(const Locale('uk'));
                  },
                  child: const Text(
                    'УКР',
                  ),
                ),
              ],
            ),
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
