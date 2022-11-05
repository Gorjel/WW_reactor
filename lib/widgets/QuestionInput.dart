import 'package:flutter/material.dart';

class QuestionInput extends StatelessWidget {
  // final TextTheme t;
  // final VoidCallback actionOnClick;
  final thisController;

  QuestionInput(this.thisController);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: thisController,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      // obscureText: _obscureText,
      style: Theme.of(context).textTheme.headline2!.copyWith(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
    );
  }
}
