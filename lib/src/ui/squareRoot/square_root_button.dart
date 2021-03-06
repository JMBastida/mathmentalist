import 'package:flutter/material.dart';
import 'package:mathmentalist/src/ui/squareRoot/square_root_view_model.dart';
import 'package:provider/provider.dart';

class SquareRootButton extends StatelessWidget {
  final String text;
  final BorderRadius borderRadius;

  SquareRootButton(this.text, this.borderRadius);

  @override
  Widget build(BuildContext context) {
    final signProvider = Provider.of<SquareRootProvider>(context);
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          signProvider.checkResult(text);
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
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ),
      ),
    );
  }
}
