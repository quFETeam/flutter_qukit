import 'package:flutter/material.dart';
import 'example/gradient_button.dart';

void main() => runApp(KitApp());

class KitApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter qukit',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
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
        title: Text('flutter qukit '),
      ),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('lib/images/wuming_01.jpeg'),
          )
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 38,right: 38),
          children: <Widget>[
            Button(
              text: 'GradientButton',
              routeName: GradientButtonRoute(),
            ),
            Button(
              text: 'GradientButton',
              routeName: GradientButtonRoute(),
            ),
            Button(
              text: 'GradientButton',
              routeName: GradientButtonRoute(),
            ),
            Button(
              text: 'GradientButton',
              routeName: GradientButtonRoute(),
            ),
            Button(
              text: 'GradientButton',
              routeName: GradientButtonRoute(),
            ),
            Button(
              text: 'GradientButton',
              routeName: GradientButtonRoute(),
            ),
            Button(
              text: 'GradientButton',
              routeName: GradientButtonRoute(),
            ),
            Button(
              text: 'GradientButton',
              routeName: GradientButtonRoute(),
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Widget routeName;
  Button({Key key,
    this.text,this.routeName
}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.cyan.withOpacity(0.8),
        onPressed: (){
         Navigator.push(context,
             MaterialPageRoute(builder: (context) => routeName,
             )
         );
      },
        child:Text(text,style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),),
    );
  }
}
