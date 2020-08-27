import 'package:flutter/material.dart';
import '../constants/qu_colors.dart';
import '../src/qu_verification_code.dart';
import '../src/qu_scaffold.dart';
import '../util/qu_screen.dart';

class QuVerificationCodeExample extends StatefulWidget {
  @override
  _QuVerificationCodeExampleState createState() => _QuVerificationCodeExampleState();
}

class _QuVerificationCodeExampleState extends State<QuVerificationCodeExample> {

  void _onTap(){
    print('获取验码');
  }

  @override
  Widget build(BuildContext context) {
    double X = QuScreen.X(context);
    return QuScaffold(title: 'QuVerificationCodeExample',
        body:Container(
          alignment: Alignment.center,
          child: QuVerificationCode(
            onTapCallback: _onTap,
            countdown: 10,
            available: true,
            availableStyle: TextStyle(
              color: QuColors.blue,
              fontSize: 16*X,
            ),
            unavailableStyle: TextStyle(
              color: QuColors.fontLightColorX,
              fontSize: 16*X,
            ),
          ),
        ),
    );
  }
}
