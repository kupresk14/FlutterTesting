import 'package:flutter/material.dart';
import 'calculator.dart';
import 'webpull.dart';
import 'shop.dart';
import 'checkout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/calculator': (context) => SecondRoute(),
        '/webtext': (context) => WebText(),
        '/shop' : (context) => Shop(),
        '/checkout' : (context) =>  CheckOut(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'An Everything App'),
    );
  }
}

///Class for the home page
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final snackBar = SnackBar(content: Text('Number is at zero!'));
  int _counter = 0;
  List<String> entries = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      if(_counter > 0) {
        _counter--;
      }
    });
  }

  void _multCounter(){
    setState(() {
      if(_counter >= 0){
        _counter = _counter * _counter;
      }
    });
  }

  void _clearCounter(){
    setState(() {
      _counter = 0;
    });
  }

  void _saveContent(int x){
    String date = (new DateTime.now().month.toString() + "/" + new DateTime.now().day.toString() + "/" + new DateTime.now().year.toString());
    setState(() {
      String value = x.toString();
      entries.add("Date: " + date + "   Calculated Number: " + value);
    });
  }

  void _clearSaves(){
    setState(() {
      if(entries.length > 0){
        entries.removeLast();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_right),
            tooltip: 'Show Calculator',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            tooltip: 'Show nonsense',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => WebText()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Goto Store',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Shop()),
              );
            },
          )
        ],
      ),
      body: Center(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(4),
                itemCount: entries.length,
                shrinkWrap: true,
                cacheExtent: 0.0,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: 50,
                    decoration: new BoxDecoration(
                        color: Colors.lightBlueAccent,
                      borderRadius: new BorderRadius.all(
                        const Radius.circular(10),
                      )
                    ),
                    child: Center(child: Text('${entries[index]}')),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            ),
            Text(
              'The count currently:',
               style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              '$_counter',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            SizedBox(height:100),
          ],
        ),
      ),
      //This makes a column of FABs instead of the singular one that was there.
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          //Increment Button
          FloatingActionButton(
            heroTag: "addbtn",
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width:10),
          //Decrement Button
          FloatingActionButton(
            heroTag: "dubBtn",
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: Icon(Icons.minimize),
          ),
          SizedBox(width:10),
          FloatingActionButton(
            heroTag: "multBtn",
            onPressed: _multCounter,
            tooltip: 'Multiply',
            child: Icon(Icons.clear),
          ),
          SizedBox(width:10),
          FloatingActionButton(
            heroTag: "clearCount",
            onPressed: _clearCounter,
            tooltip: 'Clear',
            child: Icon(Icons.clear_all),
          ),
          SizedBox(width:10),
          FloatingActionButton(
            heroTag: "saveBtn",
            onPressed: (){
              _saveContent(_counter);
            },
            tooltip: 'Save',
            child: Icon(Icons.save),
          ),
          SizedBox(width:10),
          FloatingActionButton(
            heroTag: "clearLast",
            onPressed: (){
              _clearSaves();
            },
            tooltip: 'Clear Saves',
            child: Icon(Icons.content_cut),
          ),
        ],
      )
    );
  }
}
