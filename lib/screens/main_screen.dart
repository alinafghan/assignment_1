import 'package:assignment_1/widgets/card.dart';
import 'package:assignment_1/widgets/comment_tile.dart';
import 'package:assignment_1/widgets/stats_tile.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with TickerProviderStateMixin {
  late final PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> comments = [
    {
      'title': 'Flutter Flash',
      'subtitle': '"Looks like an amazing event!"',
      'datetime': '30 November 2024, 11:00 PM',
    },
    {
      'title': 'Bob’s annual BBQ',
      'subtitle': '"Wish I could’ve been there:("',
      'datetime': '2 August 2024, 10:31 PM',
    },
    {
      'title': 'Networking Lounge',
      'subtitle': '"Will the event be starting on time?"',
      'datetime': '25 June 2023, 12:00 AM',
    },
    {
      'title': 'Other Lounge',
      'subtitle': '"Will the event be starting on time?"',
      'datetime': '25 June 2023, 12:00 AM',
    },
    {
      'title': 'Google Groups CompVis BC',
      'subtitle': '"Excited to learn!"',
      'datetime': '18 Feb 2025, 12:00 AM',
    },
  ];

  final List<Map<String, String>> posts = [
    {
      'title': 'Tech Conference',
      'address': '13th Street, Park Avenue',
      'datetime': '30th November 2024, 9:00 am',
      'name': 'John Doe'
    },
    {
      'title': 'Bob’s annual BBQ',
      'address': '13th Street, Park Avenue',
      'datetime': '30th November 2024, 9:00 am',
      'name': 'John Doe'
    },
    {
      'title': 'Networking Lounge',
      'address': '13th Street, Park Avenue',
      'datetime': '30th November 2024, 9:00 am',
      'name': 'John Doe'
    },
    {
      "title": "Tech Innovators Summit",
      "address": "45 Downtown",
      "datetime": "15th December 2024, 2:00 pm",
      "name": "Alice Smith"
    },
    {
      "title": "Mastery Workshop",
      "address": "100th Floor, Business Tower",
      "datetime": "5th January 2025, 10:30 am",
      "name": "Alina Afghan"
    }
  ];

  final List<Map<String, String>> stats = [
    {'num': '19', 'item': 'Posts'},
    {'num': '32', 'item': 'Comments'}
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBarHeight = size.height / 3; // Top 1/3 of the screen
    const profileRadius = 50.0; // Radius of the profile circle

    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: appBarHeight + profileRadius,
          child: Stack(
            // clipBehavior: Clip.none,
            children: [
              Container(
                height: appBarHeight,
                decoration: ShapeDecoration(
                  shape: CustomAppBarShape(),
                ),
              ),
              Positioned(
                top: appBarHeight - profileRadius - 50,
                left: (size.width / 2) - profileRadius,
                child: Column(
                  children: [
                    Container(
                      width: 2 * profileRadius,
                      height: 2 * profileRadius,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 7, 7,
                              7), // Change this to your desired border color
                          width: 2.0, // Set the border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: profileRadius,
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'John Doe exists. John Doe builds. John Doe innovates. What\'s next? Only time will tell...',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  _updateCurrentPageIndex(0);
                },
                child: Text(
                  'Posts',
                  style: TextStyle(
                      color: _currentPageIndex == 0 ? Colors.red : Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  _updateCurrentPageIndex(1);
                },
                child: Text(
                  'Comments',
                  style: TextStyle(
                      color: _currentPageIndex == 1 ? Colors.red : Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  _updateCurrentPageIndex(2);
                },
                child: Text(
                  'Stats',
                  style: TextStyle(
                      color: _currentPageIndex == 2 ? Colors.red : Colors.grey),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: PageView(
            onPageChanged: _updateCurrentPageIndex,
            controller: _pageController,
            children: <Widget>[
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  var post = posts[index];
                  return MyCard(
                    title: post['title'],
                    datetime: post['datetime'],
                    address: post['address'],
                    name: post['name'],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ListView.separated(
                    itemBuilder: (context, i) {
                      return CommentTile(
                          title: comments[i]['title'],
                          subtitle: comments[i]['subtitle'],
                          datetime: comments[i]['datetime']);
                    },
                    separatorBuilder: (context, i) => Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                          indent: 16,
                          endIndent: 16,
                        ),
                    itemCount: comments.length),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i in stats)
                      StatsTile(number: i['num'], item: i['item']),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  void _updateCurrentPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageController.jumpToPage(
      index,
    );
  }
}

class CustomAppBarShape extends OutlinedBorder {
  const CustomAppBarShape({super.side});

  Path _getPath(Rect rect) {
    final Path path = Path();
    final Size size = Size(rect.width, rect.height * 1.2);

    final double p0 = size.height * 0.75;
    path.lineTo(0.0, p0);

    final Offset controlPoint = Offset(size.width * 0.5, size.height / 3);
    final Offset endPoint = Offset(size.width / 1.5, size.height);
    final Offset tangentPoint = Offset(size.width, size.height * 0.85);

    path.cubicTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy,
        tangentPoint.dx, tangentPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect.inflate(side.width));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) {
      return;
    }
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.yellowAccent,
          Colors.deepOrange
        ], // Customize your gradient colors
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ).createShader(rect);

    // Draw the gradient within the custom shape
    canvas.drawPath(getOuterPath(rect, textDirection: textDirection), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return CustomAppBarShape(side: side.scale(t));
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return CustomAppBarShape(side: side ?? this.side);
  }

  // The lerpFrom method is necessary for the CustomAppBarShape to be
  // properly animated when changing the AppBar shape and when
  // the AppBar is rebuilt.
  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CustomAppBarShape) {
      return CustomAppBarShape(side: BorderSide.lerp(a.side, side, t));
    }
    return super.lerpFrom(a, t);
  }

  // The lerpTo method is necessary for the CustomAppBarShape to be
  // properly animated when changing the AppBar shape and when
  // the AppBar is rebuilt.
  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CustomAppBarShape) {
      return CustomAppBarShape(side: BorderSide.lerp(b.side, side, t));
    }
    return super.lerpTo(b, t);
  }
}
