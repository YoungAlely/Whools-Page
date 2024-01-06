import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // Importa esta biblioteca
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:whools/firebase_options.dart';
import 'package:whools/src/models/themes_colors.dart';
import 'package:whools/src/providers/CardTeamProvider.dart';
import 'package:whools/src/providers/UITheme.dart';
import 'package:whools/src/providers/theme_model.dart';
import 'package:whools/src/ui/Admin/Login.dart';
import 'package:whools/src/ui/LeadingPage.dart';
import 'package:whools/src/ui/Screens/Blog/Blog.dart';
import 'package:whools/src/ui/Screens/Blog/MarkDown.dart';

import 'src/services/StringUrl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ThemeModel themeProvider = ThemeModel();
  CardTeamProvider cardProvider = CardTeamProvider();
  UIProvider changeTheme = UIProvider();
  await themeProvider.loadThemeMode();
  await changeTheme.ChangeTheme();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  QuerySnapshot codeCollecion = await firestore.collection('Articles').get();

  Map<String, WidgetBuilder> dynamicRoutes = {};

  codeCollecion.docs.forEach((code) {
    String title = code['title'];
    String markdown = code['markDown'];
    String img = code['img'];
    String categoria = code['categoria'];
    String linkrepo = code['linkrepo'];
    String route = '/TechHub/$categoria/${sanitizeString(title)}';
    dynamicRoutes[route] = (context) => MarkDownCode(
          categoria: categoria,
          title: title,
          markdown: markdown,
          img: img,
          linkrepo: linkrepo,
        );
  });
  initializeDateFormatting('es_ES').then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeModel>.value(
            value: themeProvider,
          ),
          ChangeNotifierProvider<UIProvider>.value(
            value: changeTheme,
          ),
          ChangeNotifierProvider<CardTeamProvider>.value(
            value: cardProvider,
          ),
        ],
        child: Consumer<ThemeModel>(
          builder: (context, themeProvider, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              color: themeProvider.BlackAndWhite,
              title: 'Whools',
              theme: lightTheme,
              darkTheme: darkTheme,
              initialRoute: '/',
              routes: {
                ...dynamicRoutes,
                '/': (context) => const LeadingPage(),
                '/????': (context) => const LoginScreen(),
                '/TechHub': (context) => const BlogCode(),
              },
            );
          },
        ),
      ),
    );
  });
}
