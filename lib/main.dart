import 'package:flutter/material.dart';
import 'example/gradient_button.dart';

void main() => runApp(KitApp());

class KitApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter qukit',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: KitHomePage(),
    );
  }
}

class KitHomePage extends StatefulWidget {
  KitHomePage({Key key}) : super(key: key);
  @override
  _KitHomePageState createState() => _KitHomePageState();
}

class _KitHomePageState extends State<KitHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter qukit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => GradientButtonRoute(),
                ));
              },
              child: Text(
                'GradientButton',
              )
            )
          ],
        ),
      )
    );
  }
}
