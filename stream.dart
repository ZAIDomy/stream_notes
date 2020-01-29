import 'dart:async';

void main() {

  final order = Order('pizza');
  final jonh  = StreamTransformer.fromHandlers(
    handleData: (foodType,sink){
      if(foodType == 'pizza'){
        sink.add(new Food());
      }else{
        sink.addError('no tenemos ese producto');
      }
    }
  );

  final controller  = StreamController();
  controller.sink.add(order);
  controller.stream.map((order) => order.type)
    .transform(jonh)
    .listen(
      (pizza) => print('pedido de $pizza'),
      onError: (err) => print(err)
    );


}

class Order{
  String  type;
  Order(this.type);

}

class Food{

}