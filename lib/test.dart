import 'dart:io';
import 'dart:core';
//dart:core library https://api.dart.dev/stable/3.3.4/dart-core/dart-core-library.html

void main() {
  double? n9ita;
  
  while (true) {
    stdout.write("Enter your note: ");
    String input = stdin.readLineSync()!;
    
    // Extract numbers from input
    String numbersOnly = input.replaceAll(RegExp(r'[^0-9.]'), '');
    
    // Try to parse the extracted numbers
    n9ita = double.tryParse(numbersOnly);
    
    if (n9ita == null) {
      print("Invalid input. Please enter a valid numeric note.");
    } else if (n9ita < 0 || n9ita > 20) {
      print("Invalid note. Please enter a value between 0 and 20.");
    } else {
      break;
    }
  }

  // Determine grade category
  if (n9ita >= 0 && n9ita < 8) {
    print("manaj7ch");
  } else if (n9ita >= 8 && n9ita < 10) {
    print("modawala");
  } else if (n9ita >= 10 && n9ita < 12) {
    print("m9bol");
  } else if (n9ita >= 12 && n9ita <= 20) {
    print("7assan");
  }
}