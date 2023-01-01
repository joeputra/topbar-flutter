import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStatePage extends StatefulWidget {
  const HomeStatePage({super.key});

  @override
  State<HomeStatePage> createState() => _HomeStatePageState();
}

class _HomeStatePageState extends State<HomeStatePage> {
  List<String> tabs = [
    "Home",
    "About",
    "Contact",
    "Settings",
  ];

  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 60;
      case 2:
        return 123;
      case 3:
        return 196;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 50;
      case 1:
        return 50;
      case 2:
        return 60;
      case 3:
        return 70;
      default:
        return 80;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Costume Bar",
          style: GoogleFonts.ubuntu(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.05,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.05,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tabs.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0 ? 10 : 22, top: 7),
                                child: Text(tabs[index],
                                    style: GoogleFonts.ubuntu(
                                      fontSize: current == index ? 16 : 14,
                                      fontWeight: current == index
                                          ? FontWeight.w400
                                          : FontWeight.w300,
                                    )),
                              ),
                            );
                          }),
                    ),
                  ),
                  AnimatedPositioned(
                    bottom: 0,
                    left: changePositionedOfLine(),
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: const EdgeInsets.only(left: 10),
                      duration: const Duration(milliseconds: 500),
                      width: changeContainerWidth(),
                      height: size.height * 0.008,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.4),
              child: Text(
                "${tabs[current]} Tab Content",
                style: GoogleFonts.ubuntu(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
