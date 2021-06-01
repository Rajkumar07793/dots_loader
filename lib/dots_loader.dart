library dots_loader;
import 'package:flutter/material.dart';

class ShowDots extends StatefulWidget {
  final MainAxisAlignment mainAxisAlignment;
  final List<int> duration;
  final int noOfDots;
  final List<Color> colors;
  ShowDots({Key key, this.noOfDots, this.colors, this.duration,this.mainAxisAlignment});
  @override
  _ShowDotsState createState() => _ShowDotsState();
}

class _ShowDotsState extends State<ShowDots> {
  List<int> duration = [400, 410, 420];
  @override
  Widget build(BuildContext context) {
    List<int> duration = widget.duration??[400, 410, 420];
    int noOfDots = widget.noOfDots??3;
    List<Color> colors = widget.colors??[Colors.red, Colors.green, Colors.yellowAccent];
    return Center(
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment??MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
            noOfDots,
                (index) => LoadingDots(color: colors[index],duration: duration[index],)
        ),
      ),
    );
  }
}


class LoadingDots extends StatefulWidget {
  final duration;
  final color;
  LoadingDots({Key key, this.duration, this.color}):super(key: key);
  @override
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  animate() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: widget.duration));
    animation = Tween<double>(begin: 0, end: 20).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: animation.value,
      width: animation.value,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}