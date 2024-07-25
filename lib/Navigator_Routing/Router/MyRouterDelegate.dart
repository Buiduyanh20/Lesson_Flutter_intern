import 'package:flutter/material.dart';
import 'package:lesson_flutter_intern/Navigator_Routing/Router/Widgetrouter1.dart';
import 'package:lesson_flutter_intern/Navigator_Routing/Router/Widgetrouter2.dart';

class MyRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  final GlobalKey<NavigatorState> navigatorKey;

  String? _selectedPath;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: Widgetrouter1(
            onNavigate: () {
              navigateTo('/screen2');
            },
          ),
        ),
        if (_selectedPath == '/screen2') MaterialPage(child: Widgetrouter2()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedPath = null;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(String configuration) async {
    _selectedPath = configuration;
  }

  void navigateTo(String path) {
    _selectedPath = path;
    notifyListeners();
  }
}
