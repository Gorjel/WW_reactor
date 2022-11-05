import 'package:flutter/material.dart';
import '../widgets/TextButtonInvisibleBorder.dart';
import 'package:ww_reactor/styles.dart';
import 'QuestionViewFeel.dart';
import 'BubbleView.dart';
// import '../DatabaseHelper.dart';


class InfoView extends StatefulWidget {
  @override
  InfoViewState createState() => InfoViewState();
}

class InfoViewState extends State<InfoView> {

  @override
  void initState() {
    super.initState();
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('What is it about?', style: text_f22_w600_white), 
              SizedBox(height : 20),
              Text('This app is designed to help you to focus on what really matters to you.', 
              style: text_f14_w400_white), 
              SizedBox(height : 10),
              Text('You will be asked two very same questions from time to time', 
              style: text_f14_w400_white),
              SizedBox(height : 20), 
              Text('What do you feel?', 
              style: text_f18_w600_white), 
              SizedBox(height : 10),
              Text('What do you want?', 
              style: text_f18_w600_white),
              SizedBox(height : 20),
              Text('We belive that answers on those questions over a period of time helps to understand what areas in life are in ballance and what areas require your attention right here and right now. ', 
              style: text_f14_w400_white), 

              
            ],
          ),
        )

      ),
      bottomNavigationBar: SafeArea(
        child: Container(
            padding: new EdgeInsets.only(left: 55, right: 55, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButtonInvisibleBorder("", () {}, text_f18_w600_white,
                    child: Image.asset('assets/info_icon_selected.png',
                        fit: BoxFit.fitWidth,
                        height: 30,
                        width: 30,
                        alignment: Alignment.topCenter)),
                TextButtonInvisibleBorder("",
                    () => _goToQuestionView(context), text_f18_w600_white,
                    child: Image.asset('assets/question_icon.png',
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

void _goToBubbleView(context) async {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => BubbleView(),
      transitionDuration: Duration(seconds: 0),
    ),
  );
}


}

