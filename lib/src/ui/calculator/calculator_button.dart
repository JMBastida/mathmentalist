import 'package:flutter/material.dart';
import 'package:mathmentalist/src/ui/calculator/calculator_view_model.dart';
import 'package:provider/provider.dart';

class CalculatorButton extends StatelessWidget {
  final BorderRadius borderRadius;
  final String text;

  CalculatorButton(this.text, this.borderRadius);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context, listen: false);
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          if (text == "CLEAR") {
            provider.clearGameInput();
          } else {
            provider.checkGameResult(text);
          }
        },
        borderRadius: borderRadius,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: borderRadius,
            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          ),
          margin: EdgeInsets.all(1),
          constraints: BoxConstraints.expand(),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        ),
      ),
    );
  }
}
