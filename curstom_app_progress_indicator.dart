import 'package:flutter/material.dart';

class PercentProgressIndicator extends StatefulWidget {
  final double percent;
  final Color backgroundColor;
  final Color progressColor;
  final double height;
  final double width;
  final double borderRadius;

  const PercentProgressIndicator({
    this.percent = 0.95,
    super.key,
    this.backgroundColor = Colors.red,
    this.progressColor = Colors.white,
    this.height = 10,
    this.width = 300,
    this.borderRadius = 12,
  });

  @override
  State<PercentProgressIndicator> createState() =>
      _PercentProgressIndicatorState();
}

class _PercentProgressIndicatorState extends State<PercentProgressIndicator> {
  double _width = 0;

  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 200) //Time to animation started
        , () {
      setState(() {
        _width =
            widget.percent * MediaQuery.of(context).size.width; //0.95 * 360.0
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 2,
          decoration: BoxDecoration(color: widget.backgroundColor), //Colors.red
        ),
        AnimatedContainer(
            duration: const Duration(milliseconds: 4800),
            width: _width,
            height: 4,
            decoration: BoxDecoration(color: widget.progressColor)),
      ],
    );
  }
}
