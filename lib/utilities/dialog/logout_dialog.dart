import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialog/generic_dialog.dart';
import 'package:mynotes/extensions/buildcontext/loc.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showGenericDialog(
      context: context,
      title: context.loc.logout_button,
      content: context.loc.logout_dialog_prompt,
      optionsBuilder: () => {
            context.loc.cancel: false,
            context.loc.logout_button: true,
          }).then(
    (value) => value ?? false,
  );
}
