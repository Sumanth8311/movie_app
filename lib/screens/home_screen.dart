import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/utils/colors.dart';

import '../data/movie.dart';
import '../widgets/custom_card_normal.dart';
import '../widgets/custom_card_thumbnail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> foryouItemsList = List.of(forYouImages);
  List<MovieModel> popularItemsList = List.of(popularImages);
  List<MovieModel> genresItemList = List.of(genresList);
  List<MovieModel> legendaryItemList = List.of(legendaryImages);
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  int currentPage = 0;

  List tabBarIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.video,
    FontAwesomeIcons.user,
  ];

  List<Widget> buildPageIndicatorWidget() {
    List<Widget> list = [];
    for (int i = 0; i < foryouItemsList.length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hi, Melanie!",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(""),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: kSearchbarColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Search",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text(
                      "For you",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  foryoucardslayout(forYouImages),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: kSearchbarColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: buildPageIndicatorWidget(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Popular",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                color: kButtonColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  movieListBuidler(popularItemsList),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Genres",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                color: kButtonColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  genresBuilder(genresList),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Legendary Movies",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                color: kButtonColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 20, horizontal: 30),
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: const [
                  //           Text(
                  //             "Legendary Movies",
                  //             style: TextStyle(
                  //               color: Colors.white54,
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w300,
                  //             ),
                  //           ),
                  //           Text(
                  //             "See all",
                  //             style: TextStyle(
                  //               color: kButtonColor,
                  //               fontSize: 17,
                  //               fontWeight: FontWeight.w300,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  movieListBuidler(legendaryItemList),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30, // you are workin here ?????????///////???????////////
            left: 25,
            right: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 25.0,
                  sigmaY: 25.0,
                ),
                child: Container(
                  color: kSearchbarColor.withOpacity(0.6),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...tabBarIcons.map(
                        (e) => Icon(
                          e,
                          color: e == FontAwesomeIcons.house
                              ? Colors.white
                              : Colors.white54,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget foryoucardslayout(List<MovieModel> movieList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.47,
      child: PageView.builder(
          physics: const ClampingScrollPhysics(),
          controller: pageController,
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return CustomCardThumbnail(
              imageAsset: movieList[index].imageAsset.toString(),
            );
          },
          onPageChanged: (int page) {
            setState(() {
              currentPage = page;
            });
          }),
    );
  }

  Widget movieListBuidler(List<MovieModel> movieList) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return CustomCardNormal(
            movieModel: movieList[index],
          );
        },
      ),
    );
  }

  Widget genresBuilder(List<MovieModel> genresList) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.builder(
        itemCount: genresList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      genresList[index].imageAsset.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 30),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                child: Text(
                  genresList[index].movieName.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
