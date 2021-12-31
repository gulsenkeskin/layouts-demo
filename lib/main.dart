import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layouts_demo/screens/layout_demo.dart';
import 'package:layouts_demo/screens/shopping_list.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(""),
          ),
          body: buildBody(context),
        ));
  }

  buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Row(children: [
          shoppingListButton(context),
          layoutDemoButton(context),
        ])),
      ],
    );
  }

  shoppingListButton(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black54, // background
            onPrimary: Colors.white, // foreground
            minimumSize: const Size(0, 65)),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.checklist,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            const Text("Shopping List"),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShoppingList(
                        products: [
                          Product(name: 'Eggs'),
                          Product(name: 'Flour'),
                          Product(name: 'Chocolate chips'),
                        ],
                      )));
        },
      ),
    );
  }

  layoutDemoButton(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.black45, // background
            onPrimary: Colors.white, // foreground
            minimumSize: const Size(0, 65)
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.travel_explore,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            const Text("Travel"),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Travel()));
        },
      ),
    );
  }
}
