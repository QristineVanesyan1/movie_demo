import 'package:flutter/material.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: Colors.blue,
          child: Image(
            image: AssetImage('images/icon-send.png'),
            height: 100,
            width: 100,
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemExtent: 20,
                itemBuilder: (context, index) {
                  return Text(index.toString());
                })),
      ],
    );
  }
}
