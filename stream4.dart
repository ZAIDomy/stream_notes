import 'dart:async';
import 'dart:html';

void main() {
  
  final InputElement input = querySelector('input');
  final DivElement div = querySelector('div');

  final validator =StreamTransformer.fromHandlers(
    handleData: (inputValue,sink){
      if(inputValue.contains('@')){
        sink.add(inputValue);
      }else{
        sink.addError('ingresar email valido');
      }
    }
  );

  input.onInput
  .map((dynamic event) => event.target.value)
  .transform(validator)
  .listen(
    (value) => div.innerHtml='',
    onError: (err) => div.innerHtml=err
  );
    
}
