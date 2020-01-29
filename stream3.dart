import 'dart:html';

void main() {
  final ButtonElement button = querySelector('button');
  final InputElement input = querySelector('input');

  button.onClick
    .take(3)
    .where((event)=>input.value=='chile')
    .listen(
      (event)=>print("correcto"),
      onDone: () => print("no es correcto")
    );
    
}