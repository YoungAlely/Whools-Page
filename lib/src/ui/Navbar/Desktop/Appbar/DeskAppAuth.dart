import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/ui/LeadingPage.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

class DeskAppAuth extends StatefulWidget {
  const DeskAppAuth({super.key});

  @override
  State<DeskAppAuth> createState() => _DeskAppAuthState();
}

class _DeskAppAuthState extends State<DeskAppAuth> {
  String? imageUrl;
  String? username;
  String getSaludo(){
    final horaActual = DateTime.now().hour;
    if(horaActual >= 5 && horaActual < 12){
      return "Buenos días $username";
    }else if(horaActual >= 12 && horaActual < 18){
      return 'Buenas tardes $username';
    }else{
      return 'Buenas noches $username';
    }
  }


  @override
  void initState() {
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    final saludo = getSaludo();

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: AppBar(
          backgroundColor: HexColor("141414"),
          elevation: 0,
          
          leadingWidth: 300,
          leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LeadingPage()));
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SizedBox(
                  child: Text(
                    saludo,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.silkscreen(
                        color: themeProvider.WhiteAndBlack,
                        fontWeight: FontWeight.bold,
                         ),
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundImage: imageUrl != null
                      ? CachedNetworkImageProvider(imageUrl!)
                      : null,
                )
              ],
            )
          ],
        ));
  }

  Future<void> userData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userId = currentUser?.uid;
    if (userId != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userId)
          .get();
      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        if (mounted) {
          setState(() {
            imageUrl = userData['imageUrl'];
            username = userData['username'];
          });
        }
      }
    }
  }
}
