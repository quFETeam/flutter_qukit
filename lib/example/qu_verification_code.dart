import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../src/qu_verification_code.dart';
import '../src/qu_scaffold.dart';
import '../util/qu_screen.dart';
import '../src/qu_input_box.dart';

class QuVerificationCodeExample extends StatefulWidget {
  @override
  _QuVerificationCodeExampleState createState() => _QuVerificationCodeExampleState();
}

class _QuVerificationCodeExampleState extends State<QuVerificationCodeExample> {
  TextEditingController _quOneLineInput = new TextEditingController();
  void _onTap(){
    print('获取验码');
  }
  bool isAvailable = false;
  void _changeState(){
    if(_quOneLineInput.text.length>0){
      setState(() {
        isAvailable = true;
      });

    }else{
      setState(() {
        isAvailable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(title: 'QuVerificationCodeExample',
        body:Container(
          alignment: Alignment.center,
          child:Stack(
            children: <Widget>[
              OneLineInput(
                textColor: QuColors.fontLightColorX,
                horizontal: 16 * X,
                textEditingController: _quOneLineInput,
                function: () {
                  _changeState();
                },
              ),
              Positioned(
                right: 20*X,
                bottom: 15*X,
                child: QuVerificationCode(
              onTapCallback: _onTap,
              countdown: 10,
              available:isAvailable,
              availableStyle: TextStyle(
                color: QuColors.theme,
                fontSize: 12*X,
              ),
              unavailableStyle: TextStyle(
                color: QuColors.fontLightColorX,
                fontSize: 12*X,
              ),
            )
              ),
            ],
          ),
        ),
    );
  }
}
