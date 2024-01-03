import 'package:contacty/src/src.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/contacts",
  routes: [
    // indexed tabs for navigation bar
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/contacts",
              builder: (context, state) => const ContactsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/recents",
              builder: (context, state) => const RecentsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: "/settings",
              builder: (context, state) => const InfoPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
