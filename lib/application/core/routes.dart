import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khayam_clean/application/core/go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final routes = GoRouter(
  observers: [GoRouterObserver()],
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home/start',
  routes: innerRoute,
);
final innerRoute = [
  GoRoute(
    path: '/home/settings',
    builder: (context, state) {
      return Container(
        color: Colors.amber,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.push('/home/start'),
              child: const Text('Go to start'),
            ),
            TextButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.push('/home/start');
                }
              },
              child: const Text('Go back'),
            ),
          ],
        ),
      );
    },
  ),
  GoRoute(
    path: '/home/start',
    builder: (context, state) {
      return Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.push('/home/settings'),
              // context.go will replace the current rooute
              child: const Text('Go to settings'),
            ),
            TextButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.push('/home/settings');
                }
              },
              child: const Text('Go back'),
            ),
          ],
        ),
      );
    },
  )
];
