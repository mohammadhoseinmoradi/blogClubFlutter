import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  Assets.img.icons.notification.image(width: 32, height: 32)
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
  const _PostList();
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return _Post(posts: posts);
  }
}

class _Post extends StatelessWidget {
  const _Post({
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
                  boxShadow: const [
                    BoxShadow(blurRadius: 16, color: Color(0x1a5282ff))
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
                                  fontFamily: FontFamily.avenir,
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
