import 'dart:collection';
import 'package:flutter/material.dart';
import '../widgets/TextButtonInvisibleBorder.dart';
import 'package:ww_reactor/styles.dart';
import 'InfoView.dart';
import 'QuestionViewWant.dart';
import 'BubbleView.dart';
import '../widgets/QuestionInput.dart';

class QuestionViewFeel extends StatefulWidget {
  @override
  QuestionViewFeelState createState() => QuestionViewFeelState();
}

class QuestionViewFeelState extends State<QuestionViewFeel> {

  @override
  void initState() {
    super.initState();
  }
  TextEditingController _q1Controller = new TextEditingController(text: 'I feel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: SafeArea(
            child: Container(
              padding: new EdgeInsets.only(left: 10, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/ww_logo.png',
                    height: 120,
                    width: 120,
                  )
                ],
              ),
            ),
          )
      ),
      body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFFFA8511).withOpacity(0.7),
              Color(0xF75A5D).withOpacity(0.7)
            ],
          )
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('What do you \n FEEL?', style: text_f30_w600_white, textAlign: TextAlign.center,), 
              SizedBox(height : 20),

              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.3,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: QuestionInput(_q1Controller),
                ),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Colors.transparent, border: Border.all(color: Colors.white)),
              ),
              SizedBox(height : 10),
              TextButtonInvisibleBorder('Next', () => _goToQuestionWant(context), text_f22_w600_white)
            ],
          )
        ),
        

        
         
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
            padding: new EdgeInsets.only(left: 55, right: 55, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButtonInvisibleBorder("", () => _goToInfoView(context), text_f18_w600_white,
                    child: Image.asset('assets/info_icon.png',
                        fit: BoxFit.fitWidth,
                        height: 30,
                        width: 30,
                        alignment: Alignment.topCenter)),
                TextButtonInvisibleBorder("",
                    () => _goToQuestionView(context), text_f18_w600_white,
                    child: Image.asset('assets/question_icon_selected.png',
                        fit: BoxFit.fitWidth,
                        height: 30,
                        width: 30,
                        alignment: Alignment.topCenter)),
                TextButtonInvisibleBorder(
                    "", () => _goToBubbleView(context), text_f18_w600_white,
                    child: Image.asset('assets/bubble_icon.png',
                        fit: BoxFit.fitWidth,
                        height: 30,
                        width: 30,
                        alignment: Alignment.topCenter)),
              ],
            )),
      ),


    );
  }


void _goToQuestionView(context) async {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => QuestionViewFeel(),
      transitionDuration: Duration(seconds: 0),
    ),
  );
}

void _goToQuestionWant(context) async {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => QuestionViewWant(prevAsnwer: _q1Controller.text),
      transitionDuration: Duration(seconds: 0),
    ),
  );
}

void _goToBubbleView(context) async {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => BubbleView(),
      transitionDuration: Duration(seconds: 0),
    ),
  );
}

void _goToInfoView(context) async {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => InfoView(),
      transitionDuration: Duration(seconds: 0),
    ),
  );
}

}

