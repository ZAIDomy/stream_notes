import 'dart:html';

void main() {
  final ButtonElement button = querySelector('button');
  button.onClick
    .timeout(
      Duration(seconds: 1),
      onTimeout: (sink) => sink.addError('Perdiste')
    )
    .listen(
      (event){},
      onError:  (err) => print(err)
    );
    
}