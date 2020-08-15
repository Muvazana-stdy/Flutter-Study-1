import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  void sendMessage(String text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyApp")),
      body: Column(
        children: <Widget>[
          InputLayoutWidget(callback: this.sendMessage),
          Text(this.text)
        ],
      ),
    );
  }
}

class InputLayoutWidget extends StatefulWidget {
  Function(String) callback;

  InputLayoutWidget({this.callback});

  @override
  _InputLayoutWidgetState createState() => _InputLayoutWidgetState();
}

class _InputLayoutWidgetState extends State<InputLayoutWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onClick() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.message),
              labelText: "Your Name :",
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                splashColor: Colors.blue,
                tooltip: "Send Message",
                onPressed: () => {this.onClick()},
              )),
          controller: this.controller,
        ),
      ],
    );
  }

  

  // void changeText(text) {
  //   if (text == "Muvazana") {
  //     controller.clear();
  //   }
  //   setState(() {
  //     this.controller.text;
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: <Widget>[
  //       TextField(
  //         decoration: InputDecoration(
  //           prefixIcon: Icon(Icons.message),
  //           labelText: "Your Name :",
  //         ),
  //         controller: this.controller,
  //         onChanged: (value) => this.changeText(value),
  //       ),
  //       Text(this.controller.text),
  //     ],
  //   );
  // }
}
