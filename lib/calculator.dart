import 'package:flutter/material.dart';

///This doesn't actually have any calculation logic, just simply a test
///to see how generated lists work.
class SecondRoute extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                  readOnly: true,
                ),
                SizedBox(height: 10),
                Expanded(
                  child: GridView.count(crossAxisCount: 3,children:
                    List.generate(10, (index){
                        return Center(
                          child : FloatingActionButton(
                              heroTag: 'btn'+'$index',
                              shape: new CircleBorder(),
                              splashColor: Colors.red,
                              backgroundColor: Colors.teal,
                              child: Text('$index'),
                              onPressed: (){
                                controller.text = '$index';
                              }
                          ),
                        );
                    })
                  ),
                )
              ],
            )
        )
    );
  }
}