import 'package:flutter/material.dart';
import 'package:snap_clip_pageview_example/images.dart';
import 'package:snapclip_pageview/snapclip_pageview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'SnapClip PageView';

  var _moviesList = <Movies>[];

  @override
  void initState() {
    super.initState();
    _moviesList.addAll([
      Movies(picture1, 'War for the Planet of the Apes'),
      Movies(picture2, 'Watu Wote'),
      Movies(picture3, 'Star Wars'),
      Movies(picture4, 'Ferdinand'),
      Movies(picture5, 'Beauty and the Beast'),
      Movies(picture6, 'Boss Baby'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SnapClipPageView(
        length: _moviesList.length,
        itemBuilder: _child,
        backgroundBuilder: _background,
      ),
    );
  }

  BackgroundWidget _background(_, index) {
    final _movies = _moviesList[index];
    return BackgroundWidget(
      key: Key(index.toString()),
      index: index,
      child: Image(
        image: AssetImage(_movies.images),
        fit: BoxFit.fill,
      ),
    );
  }

  PageViewItem _child(_, int index) {
    final _movies = _moviesList[index];
    return PageViewItem(
      height: 475.0,
      index: index,
      key: Key(index.toString()),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image(
              image: AssetImage(_movies.images),
            ),
          ),
          Text(
            _movies.title.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Movies {
  final String images;
  final String title;

  Movies(this.images, this.title);
}
