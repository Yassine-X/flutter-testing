/*import 'dart:io';

void main() {
  //stdout.write("Enter your note: ");
  //double? note = double.tryParse(stdin.readLineSync()!);

  double note = 1;

  if (note == null || note < 0 || note > 20) {
    print("Invalid note. Please enter a value between 0 and 20.");
  } else if (note < 8) {
    print("manaj7ch");
  } else if (note < 10) {
    print("modawala");
  } else if (note < 12) {
    print("m9bol");
  } else {
    print("7assan");
  }
}
*/

// manaj7ch - modawala - ma9bol - 7assan (0-8 / 8-10 / 10-12 /12-20)

void main() {
  double n9ita = 10; // Simulating user input

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
