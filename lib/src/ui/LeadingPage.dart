import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/services/UrlLauncher.dart';
import 'package:whools/src/ui/Navbar/Desktop/Appbar/DesktopNav.dart';
import 'package:whools/src/ui/Navbar/Mobile/Drawers/ItemDrawer.dart';
import 'package:whools/src/ui/Navbar/Mobile/AppBars/MobileAppBar.dart';
import 'package:whools/src/ui/Screens/About/AboutUs.dart';
import 'package:whools/src/ui/Screens/About/Team.dart';
import 'package:whools/src/ui/Screens/Home/Feature_home.dart';
import 'package:whools/src/ui/Screens/Proyects/Mobile/Events.dart';
import 'package:whools/src/ui/Screens/Proyects/Mobile/Proyect.dart';
import 'package:whools/src/ui/Screens/footer.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';

class LeadingPage extends StatefulWidget {
  const LeadingPage({super.key});

  @override
  State<LeadingPage> createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPage>
    with AutomaticKeepAliveClientMixin {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  final scrollController = AutoScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: themeProvider.BlackAndWhite,
        appBar: screenSize.width < 800
            ? PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 50),
                child: const AppBarMobile(),
              )
            : PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 90),
                child: AppBarDesktop(
                  scrollController: scrollController,
                ),
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  FeatureHome(
                    screensize: screenSize,
                    scrollController: scrollController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AboutWhools(screensize: screenSize),
                  const SizedBox(
                    height: 20,
                  ),
                  TeamWhools(
                    screenSize: screenSize,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ProyectsWhools(
                    screenSize: screenSize,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const LeadinEvents(),
                  
                ],
              ),
            ],
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartDocked,
        floatingActionButton:screenSize.width < 800
            ? const SizedBox()
            : screenSize.width < 1286  ? const SizedBox()  : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 300),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            launchSocialNetwork(
                                "https://discord.gg/KRj5reGDvE");
                          },
                          hoverColor: Colors.transparent,
                          icon: Icon(LineIcons.discord,
                              color: themeProvider.WhiteAndBlack),
                        ),
                        IconButton(
                          onPressed: () {
                            launchSocialNetwork(
                                "https://www.instagram.com/bywhools/");
                          },
                          hoverColor: Colors.transparent,
                          icon: Icon(LineIcons.instagram,
                              color: themeProvider.WhiteAndBlack),
                        ),
                        IconButton(
                          onPressed: () {
                            launchSocialNetwork("https://github.com/ByWhools");
                          },
                          hoverColor: Colors.transparent,
                          icon: Icon(LineIcons.github,
                              color: themeProvider.WhiteAndBlack),
                        ),
                        IconButton(
                          onPressed: () {
                            launchSocialNetwork("https://www.tiktok.com/@bywhools");
                          },
                          hoverColor: Colors.transparent,
                          icon: Icon(Boxicons.bxl_tiktok,
                              color: themeProvider.WhiteAndBlack),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 300,
                            width: 5,
                            decoration: BoxDecoration(
                                color: Colors.grey[600],
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
        endDrawer: screenSize.width < 800
            ? ItemDrawer(
                scrollController: scrollController,
              )
            : null);
  }
}
