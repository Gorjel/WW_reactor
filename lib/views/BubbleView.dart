import 'dart:collection';
import 'package:flutter/material.dart';
import '../widgets/TextButtonInvisibleBorder.dart';
import 'package:ww_reactor/styles.dart';
import 'InfoView.dart';
import 'QuestionViewFeel.dart';
import '../DatabaseHelper.dart';


import 'package:bubble_chart/bubble_chart.dart';



import 'dart:math';


class BubbleView extends StatefulWidget {
  @override
  BubbleViewState createState() => BubbleViewState();
}

class BubbleViewState extends State<BubbleView> {
  List<BubbleNode> childNode = [];

  bool state = true;

  List<Color> colorsList_positive = [Color(0xFFFA8511),
    Color(0xFFF75A5D),
    Color(0xFFCA518A),];

  List<Color> colorsList_negative = [
    Color(0xFF855896),
    Color(0xFF475681),
    Color(0xFF2F4858),];

  @override
  void initState() {
    super.initState();
  }


 


  _addNode(int value, String text, String sentiment) {
    setState(() {
      BubbleNode node = BubbleNode.leaf(
        value: value,
        options: BubbleOptions(
          color: () {
            Random random = Random();
            // return Colors.primaries[random.nextInt(Colors.primaries.length)];
            if (sentiment == 'positive'){
              return colorsList_positive[random.nextInt(colorsList_positive.length)];
            }else{
              return colorsList_negative[random.nextInt(colorsList_negative.length)];
            }

          }(),
        child: Text(text, style: text_f14_w400_white, textAlign: TextAlign.center)
        ),
      );
      // node.options?.onTap = () {
      //   setState(() {
      //     node.value += 1;
      //     // childNode.remove(node);
      //   });
      // };
      childNode.add(node);
    });
  }
void load_data() async {
  if (state) {
    // print(await SQLHelper.getAnswers());
    var count_per_category = await SQLHelper.countPerCategory();
    var max_frequency = (count_per_category[0]['answer_count']);
      List<String> categories = [];
      List<int> sizes = [];
      List<String> sentiments = [];
      
      for (int i = 0; i < count_per_category.length; i++) {
          var row = count_per_category[i];
          var size = (row['answer_count']*10/max_frequency).round();
          var sentiment = row['sentiment'] < 0 ? 'negative' : 'positive';
          var cat = row['category'];

          _addNode(size, cat, sentiment);
      }
      state = false;

  }

    


}

  @override
  Widget build(BuildContext context) {
    load_data();
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
      child: childNode.length == 0 ? 
      Container(child: Text("No anwers to analyse yet", 
      style: text_f14_w400_white, textAlign: TextAlign.center),)
      : 

      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
            child: BubbleChartLayout(
              children: [
                BubbleNode.node(
                  padding: 15,
                  children: childNode,
                  options: BubbleOptions(color: Colors.white.withOpacity(0.3)),
                )
              ],
            ),
          ),

        ],
      )
      

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
                    child: Image.asset('assets/question_icon.png',
                        fit: BoxFit.fitWidth,
                        height: 30,
                        width: 30,
                        alignment: Alignment.topCenter)),
                TextButtonInvisibleBorder(
                    "", () {}, text_f18_w600_white,
                    child: Image.asset('assets/bubble_icon_selected.png',
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

