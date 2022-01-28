import 'package:flutter/material.dart';
import 'package:move_demo/Theme/images.dart';
import 'package:move_demo/navigation/main_navigation.dart';

class Movie {
  Movie(
      {required this.id,
      required this.imageName,
      required this.title,
      required this.time,
      required this.description});
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 0,
        imageName: 'imageName1',
        title: 'title1',
        time: 'time1',
        description: 'description1'),
    Movie(
        id: 1,
        imageName: 'imageName2',
        title: 'title2',
        time: 'time2',
        description: 'description2'),
    Movie(
        id: 2,
        imageName: 'imageName3',
        title: 'title3',
        time: 'time3',
        description: 'description3'),
    Movie(
        id: 3,
        imageName: 'imageName4',
        title: 'title4',
        time: 'time4',
        description: 'description4'),
    Movie(
        id: 4,
        imageName: 'imageName5',
        title: 'title5',
        time: 'time5',
        description: 'description5'),
    Movie(
        id: 5,
        imageName: 'imageName6',
        title: 'title6',
        time: 'time6',
        description: 'description6')
  ];
  var _filteredMovies = <Movie>[];
  final _controller = TextEditingController();
  void _searchMovies() {
    final query = _controller.value.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies
          .where((element) =>
              element.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _controller.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 70),
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
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
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(AppImages.squidGame)),
                          SizedBox(height: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  _filteredMovies[index].title,
                                  //'Spider-Man: No Way Home',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _filteredMovies[index].time,
                                  //   'December 15, 2021',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  //'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.',
                                  _filteredMovies[index].description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () => _onMovieTap(index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white.withAlpha(235)),
          ),
        )
      ],
    );
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }
}
