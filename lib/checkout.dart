import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'cart_items.dart';

class CheckOut extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text('Checkout'),
      backgroundColor: Colors.black,
      ),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItems,
        builder: (context, snapshot){
          return snapshot.data['cart items'].length > 0 ? Column(
            children: <Widget>[
              Expanded(child: checkoutListBuilder(snapshot)),
              ButtonTheme(
                minWidth: 1000,
                height: 70,
                child: RaisedButton(
                  onPressed: (){},
                  child: Text("Checkout", style: TextStyle(color: Colors.black),),
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          )
              :Center(child: Text("No items in the cart"));
        }
      )
    );
  }

  Widget checkoutListBuilder(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data["cart items"].length,
      itemBuilder: (BuildContext context, i) {
        final cartList = snapshot.data["cart items"];
        return ListTile(
          title: Text(cartList[i]['name'], style: TextStyle(color: Colors.black, fontSize: 20)),
          subtitle: Text("\$${cartList[i]['price']}",  style: TextStyle(fontSize: 16, color: Colors.white)),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart, size: 30, color: Colors.black,),
            onPressed: () {
              bloc.removeFromCart(cartList[i]);
            },
          ),
          onTap: () {},
        );
      },
    );
  }
}

