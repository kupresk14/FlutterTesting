import 'package:flutter/material.dart';
import 'cart_items.dart';

class Shop extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Shop"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/checkout'),
          )
        ],
      ),
      body: ShopWidget(),
    );
  }
}

class ShopWidget extends StatelessWidget{
  Widget build(BuildContext context){
    return StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.getStream,
      builder: (context, snapshot){
        return snapshot.data["shop items"].length > 0
            ? shopItemsListBuilder(snapshot)
            : Center(child: Text("No items in stock"));
      },
    );
  }

  Widget shopItemsListBuilder(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data["shop items"].length,
      itemBuilder: (BuildContext context, i) {
        final shopList = snapshot.data["shop items"];
        return ListTile(
          title: Text(shopList[i]['name'], style: TextStyle(color: Colors.black, fontSize: 20)),
          subtitle: Text("\$${shopList[i]['price']}", style: TextStyle(fontSize: 16, color: Colors.white)),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart, size: 30, color: Colors.black,),
            onPressed: () {
              bloc.addToCart(shopList[i]);
            },
          ),
          onTap: () {},
        );
      },
    );
  }

}
