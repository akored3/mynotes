import 'package:flutter/material.dart' show BuildContext, ModalRoute;

// Extensions allows us to add functionality to existing class
extension GetArgument on BuildContext {
  //This generic function is extracting our arguments from the BuildContext
  //But what is this arguments we're extracting
  T? getArgument<T>() {
    final modalRoute = ModalRoute.of(this);
    if (modalRoute != null) {
      final args = modalRoute.settings.arguments;
      if (args != null && args is T) {
        return args as T;
      }
    }
    return null;
  }
}
