import 'dart:async';

import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationLoadingController;

  //That animation makes the ball moves to the left.
  late Animation<double> _animationTranslateForward;

  //This one makes the ball grow a little bit from its normal size.
  late Animation<double> _animationGrowForward;

  //And this one makes the ball shrink back to its normal size.
  late Animation<double> _animationReduceForward;

  //That animation makes the ball moves to the right.
  late Animation<double> _animationTranslateBackward;

  //This one makes the ball grow a little bit from its normal size.
  late Animation<double> _animationGrowBackward;

  //And this one makes the ball shrink back to its normal size.
  late Animation<double> _animationReduceBackward;

  late Animation<double> _translateInnerBall;

  late StreamController<bool> _innerBallStreamController;

  Sink<bool> get _innerBallSink => _innerBallStreamController.sink;

  Stream<bool> get _innerBallStream => _innerBallStreamController.stream;

  @override
  void initState() {
    super.initState();

    _animationLoadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 375),
    );

    _animationTranslateForward = Tween(begin: 0.0, end: 25.0).animate(
      CurvedAnimation(
        parent: _animationLoadingController,
        curve: Curves.easeInOut,
      ),
    );

    //That one works the first half of the time.
    _animationGrowForward = Tween(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _animationLoadingController,
        curve: const Interval(0.0, 0.50, curve: Curves.easeInOut),
      ),
    );

    //And that one the second half.
    _animationReduceForward = Tween(begin: 1.05, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationLoadingController,
        curve: const Interval(0.50, 1.0, curve: Curves.easeInOut),
      ),
    );

    _animationTranslateBackward = Tween(begin: 25.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationLoadingController,
        curve: Curves.easeInOut,
      ),
    );

    //That one works the first half of the time.
    _animationGrowBackward = Tween(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationLoadingController,
        curve: const Interval(0.0, 0.50, curve: Curves.easeInOut),
      ),
    );

    //And that one the second half.
    _animationReduceBackward = Tween(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationLoadingController,
        curve: const Interval(0.50, 1.0, curve: Curves.easeInOut),
      ),
    );

    _translateInnerBall = Tween(begin: 20.0, end: -20.0).animate(
      CurvedAnimation(
        parent: _animationLoadingController,
        curve: Curves.easeInOut,
      ),
    );

    _innerBallStreamController = StreamController.broadcast();
  }

  @override
  void dispose() {
    _animationLoadingController.dispose();
    _innerBallStreamController.close();

    super.dispose();
  }

  //We are gonna use the Flow widget, it allows us to define
  //the rules of laying out the children through its delegate.

  @override
  Widget build(BuildContext context) {
    //Creating the inner ball.
    var _innerBall = ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: AnimatedBuilder(
          animation: _translateInnerBall,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_translateInnerBall.value, 0.0),
              child: child,
            );
          },
          child: Center(
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF252525),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Flow(
          delegate: LoadingAnimationDelegate(
            animationController: _animationLoadingController,
            animationTranslateForward: _animationTranslateForward,
            animationGrowForward: _animationGrowForward,
            animationReduceForward: _animationReduceForward,
            animationTranslateBackward: _animationTranslateBackward,
            animationGrowBackward: _animationGrowBackward,
            animationReduceBackward: _animationReduceBackward,
            innerBallSink: _innerBallSink,
          ),
          children: [
            //The first ball.
            Center(
              child: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF37ffec),
                ),
                child: StreamBuilder(
                  initialData: true,
                  stream: _innerBallStream,
                  builder: (context,  snapshot) {
                    return Visibility(
                      visible: snapshot.hasData,
                      child: _innerBall,
                    );
                  },
                ),
              ),
            ),
            //The second ball.
            Center(
              child: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFf21458),
                ),
                child: StreamBuilder(
                  initialData: true,
                  stream: _innerBallStream,
                  builder: (context, snapshot) {
                    return Visibility(
                      visible: !snapshot.hasData,
                      child: _innerBall,
                    );
                  },
                ),
              ),
            ),
          ],

      ),
    );
  }
}

class LoadingAnimationDelegate extends FlowDelegate {
  final AnimationController animationController;

  final Animation<double> animationTranslateForward;
  final Animation<double> animationGrowForward;
  final Animation<double> animationReduceForward;

  final Animation<double> animationTranslateBackward;
  final Animation<double> animationGrowBackward;
  final Animation<double> animationReduceBackward;

  int firstBallIndex = 0;
  int secondBallIndex = 1;

  final Sink<bool> innerBallSink;

  bool showInnerBallOnForwardBall = true;

  LoadingAnimationDelegate({
    required this.animationController,
    required this.animationTranslateForward,
    required this.animationGrowForward,
    required this.animationReduceForward,
    required this.animationTranslateBackward,
    required this.animationGrowBackward,
    required this.animationReduceBackward,
    required this.innerBallSink,
  }) : super(repaint: animationController) {
    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.value = 0.0;
        animationController.animateTo(1.0);

        _reverseChildren();
        _showInnerBallOnForwardBall();
      }
    });
  }

  _reverseChildren() {
    var tmp = firstBallIndex;
    firstBallIndex = secondBallIndex;
    secondBallIndex = tmp;
  }

  _showInnerBallOnForwardBall() {
    innerBallSink.add(showInnerBallOnForwardBall);
    showInnerBallOnForwardBall = !showInnerBallOnForwardBall;
  }

  //With that method we are gonna paint the children.
  @override
  void paintChildren(FlowPaintingContext context) {
    //Painting the first child.
    context.paintChild(
      firstBallIndex,
      transform: Matrix4.identity()
        ..translate(animationTranslateBackward.value)
        ..scale(animationGrowBackward.value)
        ..scale(animationReduceBackward.value),
    );

    //Painting the second child.
    context.paintChild(
      secondBallIndex,
      transform: Matrix4.identity()
        ..translate(animationTranslateForward.value)
        ..scale(animationGrowForward.value)
        ..scale(animationReduceForward.value),
    );
  }

  //That method is made to notify the Flow widget about
  //repainting the children.
  //But we are never gonna use it, because we've gave that mission
  //(of notifying the Flow widget) to the animationController.
  //Whenever its animation values changes, it's gonna notify the
  //Flow widget.

  @override
  bool shouldRepaint(LoadingAnimationDelegate oldDelegate) {
    return false;
  }
}