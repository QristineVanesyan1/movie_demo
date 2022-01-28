import 'package:flutter/material.dart';
import 'package:move_demo/Theme/images.dart';
import 'package:move_demo/widgets/movie_details_widget/movie_details_main_info_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({required this.id, Key? key}) : super(key: key);
  final int id;

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 23, 27, 1),
        appBar: AppBar(
          title: Text('Spider-Man: No Way Home (2021)'),
        ),
        body: ListView(
          children: const[
            MovieDetailsMainInfoWidget(),
            SizedBox(height: 30),
            MovieDetailsMainScreenCastWidget()
          ],
        ));
  }
}

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Series Cast',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            ),
          ),
          SizedBox(
            height: 300,
            child: Scrollbar(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 120,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: Offset(0, 2)),
                              ],
                              borderRadius:
                                const   BorderRadius.all(Radius.circular(5)),
                            ),
                            child: ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                child: Image(
                                    image: AssetImage(AppImages.movie1)))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Text',
                                maxLines: 1,
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'style',
                                maxLines: 1,
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'sdfuybsd fgsdgfshdjaghjdgs d fgdfughds',
                                maxLines: 4,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  print('sdfsdfdsf');
                },
                child: Text('Full Cast & Crew')),
          )
        ],
      ),
    );
  }
}
