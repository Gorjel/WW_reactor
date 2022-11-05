import 'package:flutter/material.dart';
import 'views/InfoView.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Color(0xFFFFFFFF).withOpacity(.3),
            cursorColor: Color.fromARGB(255, 255, 255, 255).withOpacity(.6),
            selectionHandleColor: Colors.white.withOpacity(.5),
          ),
          pageTransitionsTheme: PageTransitionsTheme(
              builders: {TargetPlatform.iOS: ZoomPageTransitionsBuilder(), TargetPlatform.android: ZoomPageTransitionsBuilder()}),
          primaryColor: Colors.white,
          fontFamily: 'Asap',
      ),
      home: InfoView(),
    );
  }
}








// import 'dart:math';

// import 'package:bubble_chart/bubble_chart.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<BubbleNode> childNode = [];

//   @override
//   void initState() {
//     super.initState();
//     _addNewNode();
//     _addNewNode();
//     _addNewNode();
//     _addNewNode();

//     // Timer.periodic(Duration(milliseconds: 500), (_) {
//     //   _addNewNode();
//     // });
//   }

//   _addNewNode() {
//     setState(() {
//       Random random = Random();
//       BubbleNode node = BubbleNode.leaf(
//         value: max(1, random.nextInt(10)),
//         options: BubbleOptions(
//           color: () {
//             Random random = Random();
//             return Colors.primaries[random.nextInt(Colors.primaries.length)];
//           }(),
//         ),
//       );
//       node.options?.onTap = () {
//         setState(() {
//           node.value += 1;
//           // childNode.remove(node);
//         });
//       };
//       childNode.add(node);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: BubbleChartLayout(
//           padding: 10,
//           children: [
//             BubbleNode.node(
//               padding: 15,
//               children: childNode,
//               options: BubbleOptions(color: Colors.white.withOpacity(0.5)),
//             )
//           ],
//         ),
//       )
//     );
//   }
// }