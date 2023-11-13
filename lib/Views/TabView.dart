// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, deprecated_member_use

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:myportfolio/CommonWid.dart';
import 'package:url_launcher/url_launcher.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AppBarTab(),
    );
  }
}

class AppBarTab extends StatefulWidget {
  const AppBarTab({Key? key}) : super(key: key);

  @override
  State<AppBarTab> createState() => _AppBarTabState();
}

class _AppBarTabState extends State<AppBarTab> {
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isVisible =
            _scrollController.offset > 100; // Change the offset value as needed
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            toolbarHeight: 100,
            floating: false,
            pinned: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "My",
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Text(
                        "Port",
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 153, 109, 236),
                            fontSize: 50,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const Column(
                  children: [
                    // Replace these with your actual widgets
                    HeadTab(),
                    StackesusedTab(),
                    BootingTab(),
                    SpecialContentTab(),
                    ContactTab(),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
      drawer: DrawerWid(context, _scrollController),
      floatingActionButton: _isVisible
          ? FloatingActionButton(
              hoverColor: Colors.red,
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.arrow_upward,
              ),
            )
          : null,
    );
  }
}

class HeadTab extends StatefulWidget {
  const HeadTab({Key? key});

  @override
  _HeadTabState createState() => _HeadTabState();
}

class _HeadTabState extends State<HeadTab> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(top: 30, left: 30),
      width: width,
      height: height,
      // / 1.5,
      color: Colors.black,
      child: Column(
        children: [
          Flexible(child: Container()),
          FadeTransition(
            opacity: _opacityAnimation,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      color: Colors.black,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("I",
                                    style: GoogleFonts.outfit(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 70,
                                            fontWeight: FontWeight.normal))),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text("t's",
                                        style: GoogleFonts.outfit(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 50,
                                                fontWeight:
                                                    FontWeight.normal)))),
                                const SizedBox(
                                  width: 50,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text("#Developer",
                                        style: GoogleFonts.outfit(
                                            textStyle: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 186, 122, 255),
                                                fontSize: 40,
                                                fontWeight:
                                                    FontWeight.normal)))),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Mukilan",
                                style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 120,
                                        letterSpacing: 5,
                                        fontWeight: FontWeight.normal))),
                            Text(
                              "Innovative tech enthusiast revolutionizing \nstartups along coding and Automotive.",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.outfit(
                                  color: Colors.grey[500],
                                  textStyle: const TextStyle(
                                    fontSize: 30,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.normal,
                                  )),
                            )
                          ])),
                  Container(
                    width: 400,
                    height: 200,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Flexible(flex: 3, child: Container()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class BootingTab extends StatelessWidget {
  const BootingTab({Key? key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 1100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/BootingImags.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        padding:
            const EdgeInsets.only(left: 50, top: 50, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Iam Equipped \nWith the \nParts",
              style: GoogleFonts.outfit(color: Colors.white, fontSize: 55),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "#App\nDevelopment",
                      style: GoogleFonts.outfit(
                          color: const Color(0xFFBDC6F0), fontSize: 40),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      "#Automomation",
                      style: GoogleFonts.outfit(
                          color: const Color(0xFFBDC6F0), fontSize: 40),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "#Backend",
                      style: GoogleFonts.outfit(
                          color: const Color(0xFFBDC6F0), fontSize: 40),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(
                      "#Robotics",
                      style: GoogleFonts.outfit(
                          color: const Color(0xFFBDC6F0), fontSize: 40),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "#Team\nManagement",
                      style: GoogleFonts.outfit(
                          color: const Color(0xFFBDC6F0), fontSize: 40),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Text(
                      "#Startup",
                      style: GoogleFonts.outfit(
                          color: const Color(0xFFBDC6F0), fontSize: 40),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StackesusedTab extends StatelessWidget {
  const StackesusedTab({Key? key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double height1 = height;
    return Container(
        height: width < 883 ? height1 + 300 : height + 150,
        width: width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Background1.png"), fit: BoxFit.fill)),
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Flexible(child: Container()),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // Tranform Text
                GradientAnimationText(
                  text: Text(
                    'Stacks in my Box',
                    style: GoogleFonts.outfit(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  colors: const [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 110, 129, 255),
                    Color.fromARGB(255, 113, 132, 255),
                  ],
                  duration: const Duration(seconds: 5),
                  transform: const GradientRotation(20 / 4), // tranform
                ),
              ]),
              const SizedBox(
                height: 40,
              ),
              Container(
                  padding: const EdgeInsets.all(50),
                  child: Wrap(
                    spacing: 50,
                    alignment: WrapAlignment.center,
                    runSpacing: 50, // Spacing between rows
                    children: [
                      _buildHoverAnimatedImage("assets/python.png", 120, 120),
                      _buildHoverAnimatedImage("assets/flutter.png", 120, 120),
                      _buildHoverAnimatedImage("assets/firebase.png", 130, 130),
                      _buildHoverAnimatedImage("assets/django.png", 100, 200),
                      _buildHoverAnimatedImage("assets/thonny.png", 140, 140),
                      _buildHoverAnimatedImage("assets/figma.png", 140, 140),
                      _buildHoverAnimatedImage("assets/rpi2.png", 130, 150),
                      _buildHoverAnimatedImage("assets/arduino.png", 120, 150),
                      _buildHoverAnimatedImage("assets/github.png", 110, 200),
                      _buildHoverAnimatedImage("assets/canva.png", 100, 170),
                    ],
                  )),
              Flexible(child: Container()),
            ])));
  }

  Widget _buildHoverAnimatedImage(
      String imagePath, double height, double width) {
    return MouseRegion(
      child: HoverAnimatedWidget(
          imagePath: imagePath, height: height, width: width),
    );
  }
}

class SpecialContentTab extends StatefulWidget {
  const SpecialContentTab({Key? key});

  @override
  _SpecialContentTabState createState() => _SpecialContentTabState();
}

class _SpecialContentTabState extends State<SpecialContentTab> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 1000,
      width: width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg3.gif"), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 400,
              color: const Color.fromARGB(255, 219, 220, 255),
              child: FittedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      '“ It’s fine to celebrate success, but it is \nmore important to heed the lessons of failure.”',
                      style: GoogleFonts.outfit(
                        color: const Color.fromARGB(255, 0, 0, 0),

                        // Adjust this factor based on your preference
                      ),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ))),
          // SizedBox(
          //   height: 50,
          // ),
          Container(
              height: 400,
              color: Colors.black,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        '“Innovation distinguishes between \na leader and a follower.”',
                        style: GoogleFonts.outfit(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class HoverAnimatedWidget extends StatefulWidget {
  final String imagePath;
  final double height;
  final double width;

  const HoverAnimatedWidget({
    required this.imagePath,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  _HoverAnimatedWidgetState createState() => _HoverAnimatedWidgetState();
}

class _HoverAnimatedWidgetState extends State<HoverAnimatedWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = false),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: _isHovered ? widget.height + 20 : widget.height,
        width: _isHovered ? widget.width + 20 : widget.width,
        child: Image.asset(
          widget.imagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class ContactTab extends StatefulWidget {
  const ContactTab({Key? key});

  @override
  _ContactDeskTabState createState() => _ContactDeskTabState();
}

class _ContactDeskTabState extends State<ContactTab> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      height: 500,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Transform Text
              Text(
                'Connect me',
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            child: Container(
              height: 1,
              width: 500,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 1,
              width: 300,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const MailBtn(
              icon: Icons.email,
              color: Colors.red,
              email: 'mukilanmailspace@gmail.com',
            ),
            CustomIconButton(
              icon: MdiIcons.github,
              color: Colors.white,
              url: GitHubURL,
            ),
            CustomIconButton(
              icon: MdiIcons.linkedin,
              color: const Color.fromARGB(255, 27, 118, 255),
              url: LinkedInURL,
            ),
            CustomIconButton(
              icon: MdiIcons.twitter,
              color: Colors.blue,
              url: TwitterURL,
            )
          ]),
          Flexible(child: Container()),
          Text(
            "Innovator at heart, creator by passion, tech enthusiast by profession.",
            style: GoogleFonts.outfit(
                color: const Color.fromARGB(255, 255, 255, 255)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
              width: width,
              height: 150,
              child: const Image(
                image: AssetImage(
                  "assets/Bottom.png",
                ),
                fit: BoxFit.fill,
              ))
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String url;

  const CustomIconButton({
    required this.icon,
    required this.color,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(
            url,
            forceSafariVC: false,
            forceWebView: false,
            webOnlyWindowName:
                '_blank', // Specify '_blank' to open in a new tab
          );
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          icon,
          color: color,
          size: 50,
        ),
      ),
    );
  }
}

class MailBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String email;

  const MailBtn({
    required this.icon,
    required this.color,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Email Address'),
              content: Text(email),
              actions: [
                TextButton(
                  child: Text('Copy'),
                  onPressed: () {
                    FlutterClipboard.copy(email).then((result) {
                      final snackBar = SnackBar(
                        content: Text('Copied to Clipboard'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          icon,
          color: color,
          size: 50,
        ),
      ),
    );
  }
}
