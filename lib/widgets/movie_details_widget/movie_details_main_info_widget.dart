import 'dart:math';

import 'package:flutter/material.dart';
import 'package:move_demo/Theme/images.dart';

class MovieDetailsMainInfoWidget extends StatefulWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  _MovieDetailsMainInfoWidgetState createState() =>
      _MovieDetailsMainInfoWidgetState();
}

class _MovieDetailsMainInfoWidgetState
    extends State<MovieDetailsMainInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPosterWidget(),
        _MovieNameWidget(),
        _ScoreWidget(),
        _SummeryWidget(),
        _OverviewWidget(),
        _DescriptionWidget(),
        SizedBox(height: 30),
        _PeopleWidget(),
      ],
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const  nameStyle =  TextStyle(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600);
    const jobTitleStyle =  TextStyle(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Takayuki Hamana',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: jobTitleStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rintarou Ikeda',
                  style: nameStyle,
                ),
                Text(
                  'Screenplay',
                  style: jobTitleStyle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Takayuki Hamana',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: jobTitleStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rintarou Ikeda',
                  style: nameStyle,
                ),
                Text(
                  'Screenplay',
                  style: jobTitleStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        "With the help of the \"Dragon Sin of Wrath\" Meliodas and the worst rebels in histo",
        style: TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Overview',
        style: TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(
          image: AssetImage(AppImages.movie2),
        ),
        Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child: Image(
              height: 100,
              width: 100,
              image: AssetImage(AppImages.movie1),
            )),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RichText(
        maxLines: 3,
        text: const TextSpan(
          children: [
            TextSpan(
                text: 'Far From the Tree',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: '(2021)',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.black,
      child: Center(
        child: Text(
          "G 11/24/2021 (US) Animation, Family 7m",
          maxLines: 3,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                ),
                Container(
                    height: 100,
                    width: 100,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: RadialPersenWidget(
                      percent: 0.2,
                      fillColor: Colors.black,
                      lineColor: Colors.green,
                      lineWidth: 5,
                      freeColor: Colors.yellow,
                    )),
                SizedBox(width: 10),
                Text('User Score'),
              ],
            )),
        Container(
          width: 1,
          height: 15,
          color: Colors.grey,
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.play_arrow),
                Text('Play Trialer'),
              ],
            )),
      ],
    );
  }
}

class RadialPersenWidget extends StatefulWidget {
  const RadialPersenWidget(
      {required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth,
      Key? key})
      : super(key: key);
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;
  @override
  _RadialPersenWidgetState createState() => _RadialPersenWidgetState();
}

class _RadialPersenWidgetState extends State<RadialPersenWidget> {
  late double percent;
  @override
  void initState() {
    super.initState();
    percent = widget.percent * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
              percent: widget.percent,
              fillColor: widget.fillColor,
              freeColor: widget.freeColor,
              lineColor: widget.lineColor,
              lineWidth: widget.lineWidth),
        ),
        Container(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text("$percent %"),
            )),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;
  @override
  void paint(Canvas canvas, Size size) {
    Rect rectArc = _calculateRect(size);

    _drawBackground(canvas, size);

    _drawFillArc(canvas, rectArc);

    _drawFreeArc(canvas, rectArc);
  }

  void _drawFreeArc(Canvas canvas, Rect rectArc) {
    final painter = Paint();
    painter.color = lineColor;
    painter.style = PaintingStyle.stroke;
    painter.strokeWidth = 5;
    painter.strokeCap = StrokeCap.round;
    canvas.drawArc(rectArc, -pi / 2, pi * 2 * percent, false, painter);
  }

  void _drawFillArc(Canvas canvas, Rect rectArc) {
    final painter = Paint();
    painter.color = freeColor;
    painter.style = PaintingStyle.stroke;
    painter.strokeWidth = lineWidth;

    canvas.drawArc(
        rectArc, -pi / 2, -1 * pi * 2 * (1 - percent), false, painter);
  }

  void _drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect _calculateRect(Size size) {
    final Rect rectArc = Offset((lineWidth / 2), (lineWidth / 2)) &
        Size(size.width - (lineWidth / 2), size.height - (lineWidth / 2));
    return rectArc;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
