import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whools/src/services/StringUrl.dart';
import 'package:whools/src/services/UrlLauncher.dart';
import 'package:whools/src/ui/Screens/Blog/AppBar.dart';
import 'package:whools/src/ui/Screens/Blog/MarkDown.dart';
import 'package:whools/src/widgets/ContainerHub.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';

class BlogCode extends StatefulWidget {
  const BlogCode({super.key});

  @override
  State<BlogCode> createState() => _BlogCodeState();
}

class _BlogCodeState extends State<BlogCode> {
  Color contCol = Colors.transparent;
  String imageUrl = "";
  String? categoria = "";
  String? title = "";
  String subtile = "";
  String? img = "";

  Color iconCol = Colors.black;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: const AppbarBlog(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width / 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: containerHub(
                  imageUrl: imageUrl, width: width, context: context),
            ),
            Row(
              children: [
                const LineIcon.timesCircle(
                  color: Colors.white,
                ),
                const SizedBox(width: 20),
                Text(
                  "Lo último en Whools",
                  style: GoogleFonts.silkscreen(
                    color: Colors.white,
                    fontSize: ResponsiveWidget.isSmallScreen(context) ? 15 : 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: width,
                    height: 400,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Articles")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error ${snapshot.error}');
                        } else {
                          return Container(
                            width: width,
                            height: 300,
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot document =
                                    snapshot.data!.docs[index];
                                Map<String, dynamic> data =
                                    document.data() as Map<String, dynamic>;
                                String? title = "${data['title']}";
                                String? categoria = "${data['categoria']}";
                                return GestureDetector(
                                    onTap: () async {
                                      String route =
                                          '/TechHub/$categoria/${sanitizeString(title)}';
                                      Navigator.pushNamed(context, route);
                                    },
                                    child: BlogItemCard(
                                      data: data,
                                    ));
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                if (width >= 904)
                  ResponsiveWidget.isSmallScreen(context)
                      ? const SizedBox()
                      : Expanded(
                          child: Container(
                          margin: const EdgeInsets.only(left: 100),
                          alignment: Alignment.topCenter,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "¿Ya nos sigues?",
                                style: GoogleFonts.silkscreen(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: const Icon(
                                  LineIcons.instagram,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  launchSocialNetwork(
                                      "https://www.instagram.com/bywhools/");
                                },
                                title: Text(
                                  "bywhools",
                                  style:
                                      GoogleFonts.openSans(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                leading: const Icon(
                                  LineIcons.github,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  launchSocialNetwork(
                                      "https://github.com/ByWhools");
                                },
                                title: Text(
                                  "ByWhools",
                                  style:
                                      GoogleFonts.openSans(color: Colors.white),
                                ),
                              ),
                              ListTile(
                                leading: const Icon(
                                  LineIcons.discord,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  launchSocialNetwork(
                                      "https://discord.gg/KRj5reGDvE");
                                },
                                title: Text(
                                  "Whools? team",
                                  style:
                                      GoogleFonts.openSans(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    createDynamicRoutes();
    gifChange();
  }

  void createDynamicRoutes() async {
    Map<String, WidgetBuilder> dynamicRoutes = {};

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot codeCollecion = await firestore.collection('Articles').get();
    codeCollecion.docs.forEach((code) {
      String title = code['title'];
      String markdown = code['markDown'];
      String img = code['img'];
      String categoria = code['categoria'];
      String linkrepo = code['linkrepo'];
      String route = '/TechHub/$categoria/${title.replaceAll(' ', '-')}';
      dynamicRoutes[route] = (context) => MarkDownCode(
            categoria: categoria,
            title: title,
            markdown: markdown,
            img: img,
            linkrepo: linkrepo,
          );
    });
  }

  Future<void> gifChange() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection("gif")
        .doc("2keaCAv7ykbZS1ui2x3B")
        .get();
    if (userSnapshot.exists) {
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      setState(() {
        imageUrl = userData['img'];
      });
    }
  }
}

class BlogItemCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const BlogItemCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                trailing: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider("${data['img']}"),
                  )),
                ),
                title: Text(
                  "${data['title']}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                    width: 100,
                    height: 100,
                    child: Text(
                      "${data['markDown']}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )),
              )
            ]),
      ],
    );
  }
}
