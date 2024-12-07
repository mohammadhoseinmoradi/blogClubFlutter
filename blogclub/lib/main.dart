import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './data.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const DefaultFontFamily = "Avenir";
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextcolor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376aed);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: WidgetStateProperty.all(const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: DefaultFontFamily)))),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontFamily: DefaultFontFamily,
                fontWeight: FontWeight.bold,
                color: primaryTextcolor,
                fontSize: 24),
            titleSmall: TextStyle(
                fontFamily: DefaultFontFamily,
                color: secondaryTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 18),
            titleLarge: TextStyle(
                fontFamily: DefaultFontFamily,
                color: primaryTextcolor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            bodyMedium: TextStyle(
                fontFamily: DefaultFontFamily,
                color: secondaryTextColor,
                fontSize: 12),
            bodyLarge: TextStyle(
                fontFamily: DefaultFontFamily,
                fontWeight: FontWeight.bold,
                color: primaryTextcolor,
                fontSize: 18),
            bodySmall: TextStyle(
                fontFamily: DefaultFontFamily,
                fontWeight: FontWeight.bold,
                color: Color(0xff7b8bb2),
                fontSize: 10),
            headlineMedium: TextStyle(
                fontFamily: DefaultFontFamily,
                fontSize: 20,
                color: primaryTextcolor,
                fontWeight: FontWeight.w700)),
      ),
      home: Stack(children: [
        const Positioned.fill(child: HomeScreen()),
        Positioned(bottom: 0, right: 0, left: 0, child: _BootomNavigation())
      ]),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 25, 32, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi , Jonathan!",
                    style: themeData.textTheme.titleSmall,
                  ),
                  Image.asset(
                    'assets/img/icons/notification.png',
                    width: 32,
                    height: 32,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
              child: Text(
                'Explore Today',
                style: themeData.textTheme.headlineLarge,
              ),
            ),
            _StoryList(stories: stories, themeData: themeData),
            const SizedBox(
              height: 16,
            ),
            const _CategoryList(),
            const _PostList(),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    ));
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _CategoryItem(
            left: realIndex == 0 ? 32 : 8,
            right: realIndex == categories.length - 1 ? 32 : 8,
            category: categories[realIndex],
          );
        },
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.8,
          aspectRatio: 1.2,
          initialPage: 0,
          disableCenter: true,
          enableInfiniteScroll: false,
          scrollPhysics: const BouncingScrollPhysics(),
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ));
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const _CategoryItem({
    required this.category,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(children: [
        Positioned.fill(
            top: 100,
            right: 65,
            left: 65,
            bottom: 24,
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xaa0d253c))
                ],
              ),
            )),
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Color(0xff0d253c), Colors.transparent])),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(32)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/img/posts/large/${category.imageFileName}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 48,
          left: 32,
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .apply(color: Colors.white),
          ),
        )
      ]),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    required this.stories,
    required this.themeData,
  });

  final List<StoryData> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          itemCount: stories.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story, themeData: themeData);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    required this.story,
    required this.themeData,
  });

  final StoryData story;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewed() : _profileImageNormal(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(story.name, style: themeData.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Container _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff376AED),
            Color(0xff40b0e2),
            Color(0xff9cecfb)
          ])),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        padding: const EdgeInsets.all(5),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24),
        color: const Color(0xff7b8bb2),
        dashPattern: const [8, 3],
        padding: const EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset('assets/img/stories/${story.imageFileName}'),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({super.key});
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return _Post(posts: posts);
  }
}

class _Post extends StatelessWidget {
  const _Post({
    super.key,
    required this.posts,
  });

  final List<PostData> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest News',
                  style: Theme.of(context).textTheme.headlineMedium),
              TextButton(
                onPressed: () {},
                child: const Text('More',
                    style: TextStyle(color: Color(0xff376aed))),
              ),
            ],
          ),
        ),
        ListView.builder(
            itemCount: posts.length,
            itemExtent: 141,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final post = posts[index];

              return Container(
                margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    const BoxShadow(blurRadius: 16, color: Color(0x1a5282ff))
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                          'assets/img/posts/small/${post.imageFileName}'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.caption,
                              style: const TextStyle(
                                  fontFamily: MyApp.DefaultFontFamily,
                                  color: Color(0xff376aed),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              post.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(CupertinoIcons.hand_thumbsup,
                                    size: 16,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  post.likes,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(width: 16),
                                Icon(CupertinoIcons.clock,
                                    size: 16,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  post.time,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                        post.isBookmarked
                                            ? CupertinoIcons.bookmark_fill
                                            : CupertinoIcons.bookmark,
                                        size: 16,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            })
      ],
    );
  }
}

class _BootomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 65,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 20, color: Color(0xaa9b8487))
            ]),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BottomNavigationItem(
                  iconFileName: 'Home.png',
                  activeIconFileName: 'Home.png',
                  title: 'Home',
                ),
                _BottomNavigationItem(
                  iconFileName: 'Articles.png',
                  activeIconFileName: 'Articles.png',
                  title: 'Article',
                ),
                SizedBox(
                  width: 8,
                ),
                _BottomNavigationItem(
                  iconFileName: 'Search.png',
                  activeIconFileName: 'Search.png',
                  title: 'Search',
                ),
                _BottomNavigationItem(
                  iconFileName: 'Menu.png',
                  activeIconFileName: 'Menu.png',
                  title: 'Menu',
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            width: 65,
            height: 85,
            alignment: Alignment.topCenter,
            child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: const Color(0xff376aed),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: Image.asset('assets/img/icons/plus.png')),
          ),
        )
      ]),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  const _BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/img/icons/${iconFileName}',
        ),
        const SizedBox(
          height: 4,
        ),
        Text(title, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
