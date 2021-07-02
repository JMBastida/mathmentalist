import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:mathmentalist/src/ui/dashboard/dashboard_view_model.dart';
import 'package:mathmentalist/src/core/app_constant.dart';
import 'package:mathmentalist/src/service/navigation_service.dart';

import 'package:mathmentalist/src/core/size_config.dart';

import 'package:provider_architecture/provider_architecture.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;
  Animation<Offset> _offsetLeftEnter;
  Animation<Offset> _offsetRightEnter;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );
    _offsetLeftEnter = Tween<Offset>(
      begin: Offset(2.0, 0.0),
      end: Offset.zero,
    ).animate(_controller);

    _offsetRightEnter = Tween<Offset>(
      begin: Offset(-2.0, 0.0),
      end: Offset.zero,
    ).animate(_controller);

    /*_offsetLeftEnter.addListener(() {
      setState(() {});
    });*/
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    print("hello");
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  final outerGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Colors.white60, Colors.white]),
    borderRadius: BorderRadius.circular(12),
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _scale = 1 - _controller.value;

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: ViewModelProvider.withConsumer(
            reuseExisting: true,
            viewModel: GetIt.I<DashboardViewModel>(),
            onModelReady: (model) => model.initialise(),
            builder: (context, DashboardViewModel model, child) => Container(
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                            constraints: BoxConstraints.expand(),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        "assets/images/goal.svg",
                                        width: 18,
                                        height: 18,
                                      ),
                                      SizedBox(width: 5),
                                      Text(model.overallScore.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1),
                                      SizedBox(width: 30),
                                      SvgPicture.asset(
                                        "assets/images/money.svg",
                                        width: 18,
                                        height: 18,
                                      ),
                                      SizedBox(width: 5),
                                      Text(model.totalCoin.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 2,
                        child: Container(
                            constraints: BoxConstraints.expand(),
                            alignment: Alignment.center,
                            child: Text("MathMentalist",
                                style: Theme.of(context).textTheme.headline4)),
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: (SizeConfig.screenHeight / 20),
                            ),
                            GestureDetector(
                              onTapDown: (tapDownDetails) {
                                GetIt.I<NavigationService>().navigateTo(
                                    KeyUtil.Home,
                                    arguments: PuzzleType.MATH_PUZZLE);
                              },
                              child: SlideTransition(
                                position: _offsetLeftEnter,
                                child: Container(
                                  margin: EdgeInsets.all(12),
                                  width: (SizeConfig.screenWidth / 10) * 7,
                                  height: 66.0,
                                  decoration: outerGradientBoxDecoration,
                                  child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: new BackdropFilter(
                                          filter: new ImageFilter.blur(
                                              sigmaX: 100.0, sigmaY: 100.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text("Math Puzzle",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5)),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTapDown: (tapDownDetails) {
                                GetIt.I<NavigationService>().navigateTo(
                                    KeyUtil.Home,
                                    arguments: PuzzleType.MEMORY_PUZZLE);
                              },
                              child: SlideTransition(
                                position: _offsetRightEnter,
                                child: Container(
                                  margin: EdgeInsets.all(12),
                                  width: (SizeConfig.screenWidth / 10) * 7,
                                  height: 66.0,
                                  decoration: outerGradientBoxDecoration,
                                  child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: new BackdropFilter(
                                          filter: new ImageFilter.blur(
                                              sigmaX: 100.0, sigmaY: 100.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text("Memory Puzzle",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5)),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTapDown: (tapDownDetails) {
                                GetIt.I<NavigationService>().navigateTo(
                                    KeyUtil.Home,
                                    arguments: PuzzleType.BRAIN_PUZZLE);
                              },
                              child: SlideTransition(
                                position: _offsetLeftEnter,
                                child: Container(
                                  margin: EdgeInsets.all(12),
                                  width: (SizeConfig.screenWidth / 10) * 7,
                                  height: 66.0,
                                  decoration: outerGradientBoxDecoration,
                                  child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: new BackdropFilter(
                                          filter: new ImageFilter.blur(
                                              sigmaX: 100.0, sigmaY: 100.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text("Train Your Brain",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5)),
                                        ),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(flex: 1, child: Text('Beta version')),
                    ],
                  ),
                )),
      ),
    );
  }
}
