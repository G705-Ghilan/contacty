import 'package:contacty/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: context.sysOverlayStyle,
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (int index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.phone_outlined),
              selectedIcon: Icon(Icons.phone_rounded),
              label: "Contacts",
            ),
            NavigationDestination(
              icon: Icon(Icons.phone_callback_outlined),
              selectedIcon: Icon(Icons.phone_callback_rounded),
              label: "Recents",
            ),
            NavigationDestination(
              icon: Icon(Icons.show_chart_rounded),
              label: "Info",
            ),
          ],
        ),
      ),
    );
  }
}
