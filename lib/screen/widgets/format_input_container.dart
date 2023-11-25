// import 'package:flutter/services.dart';

// class InputContainerFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     String newText = newValue.text;

//     // Remove any spaces from the new text.
//     newText = newText.replaceAll(' ', '');
//     newText = newText.replaceAll('-', '');

//     if (newText.length > 0) {
//       // Insert a space after every 11 characters.
//       StringBuffer formattedValue = StringBuffer();
//       for (int i = 0; i < newText.length; i++) {
//         formattedValue.write(newText[i]);
//         if ((i + 1) % 11 == 0 && i != newText.length - 1) {
//           formattedValue.write(' - ');
//         }
//       }

//       return TextEditingValue(
//         text: formattedValue.toString(),
//         selection: TextSelection.collapsed(offset: formattedValue.length),
//       );
//     } else {
//       return newValue;
//     }
//   }
// }
