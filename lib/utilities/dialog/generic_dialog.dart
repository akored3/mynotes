import 'package:flutter/material.dart';

//This custom function returns a map of string for the text on a button and a value for the button
typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
}) {
  //Let's grab all the options that the caller wants us to display
  final options = optionsBuilder();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: options.keys.map((optionsTitle) {
            //This retrieves the corresponding value for each key in the map
            final value = options[optionsTitle];
            return TextButton(
              onPressed: () {
                if (value != null) {
                  Navigator.of(context).pop(value);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text(optionsTitle),
            );
          }).toList());
    },
  );
}

//Revision
List<int> numbers = [1, 2, 3, 4, 5];
List<String> numberStrings = numbers.map((number) => 'Number $number').toList();
