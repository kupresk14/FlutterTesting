/// The [dart:async] is necessary for using streams
import 'dart:async';

class CartItems{
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;

  /// The [allItems] Map would hold all the data this bloc provides
  final Map allItems = {
    'shop items': [
      {'name': 'Testing Kit', 'price': 30, 'id': 1},
      {'name': 'Math Book', 'price': 400, 'id': 2},
      {'name': 'Plate of food', 'price': 24, 'id': 3},
      {'name': 'Beer', 'price': 15, 'id': 4},
      {'name': 'A large hat', 'price': 23, 'id': 5},
      {'name': 'A piece of paper', 'price': 1, 'id': 6},
      {'name': 'Toilet Paper', 'price': 30000, 'id': 7},
      {'name': 'Better Kit', 'price': 40, 'id': 8},
      {'name': 'Math Books', 'price': 4000, 'id': 9},
      {'name': 'Some Salt', 'price': 5, 'id': 10},
      {'name': 'More Beer', 'price': 10, 'id': 11},
      {'name': 'A large hat', 'price': 23, 'id': 12},
      {'name': 'A piece of paper', 'price': 1, 'id': 13},
      {'name': 'Toilet Paper', 'price': 30000, 'id': 14},
    ],
    'cart items': []
  };

  ///Function which allows us to add an item to the cart
  void addToCart(item){
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  ///Function which allows us to remove an item from the cart
  void removeFromCart(item){
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItems();



