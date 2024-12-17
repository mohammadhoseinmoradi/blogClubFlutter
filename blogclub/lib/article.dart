import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
            color: themeData.colorScheme.primary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: themeData.colorScheme.primary.withOpacity(0.5))
            ]),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'Like button is clicked');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.img.icons.thumbs),
              const SizedBox(
                width: 8,
              ),
              Text(
                '2.1 K',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: themeData.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(children: [
        CustomScrollView(slivers: [
          SliverAppBar(
            title: Text(
              'Article',
              style: themeData.textTheme.bodyLarge,
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
              const SizedBox(
                width: 16,
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Text(
                    "Four Things Every Women Needs To Know",
                    style: themeData.textTheme.headlineLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.img.stories.story9
                              .image(width: 48, height: 48, fit: BoxFit.cover)),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'mohammad hosein',
                              style: themeData.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text('moradi')
                          ],
                        ),
                      ),
                      IconButton(
                          color: themeData.colorScheme.primary,
                          onPressed: () {
                            showSnackBar(context, 'bookmark button is clicked');
                          },
                          icon: const Icon(CupertinoIcons.bookmark)),
                      IconButton(
                          color: themeData.colorScheme.primary,
                          onPressed: () {
                            showSnackBar(context, 'share button is clicked');
                          },
                          icon: const Icon(CupertinoIcons.share))
                    ],
                  ),
                ),
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    child: Assets.img.background.singlePost.image()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                  child: Text(
                      "a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam",
                      style: themeData.textTheme.bodyLarge),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                  child: Text(
                    "a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam a man salam salamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalamsalam salamsalamsalamsalam salamsalam ",
                    style: themeData.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          )
        ]),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 116,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  themeData.colorScheme.surface,
                  themeData.colorScheme.surface.withOpacity(0),
                ])),
          ),
        )
      ]),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
    ));
  }
}
