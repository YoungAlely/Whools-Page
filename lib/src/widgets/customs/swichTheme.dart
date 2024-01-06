import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:whools/src/providers/theme_model.dart';

class ThemeSwitcher extends StatefulWidget {
  final ThemeModel themeProvider;

  ThemeSwitcher({required this.themeProvider});

  @override
  _ThemeSwitcherState createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> with TickerProviderStateMixin {
    late AnimationController animationController;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _toggleThemeAndAnimate() {
    setState(() {
      isAnimating = true;
      widget.themeProvider.toggleModeTheme(!widget.themeProvider.isDarkMode);
      if (isAnimating) {
        animationController.forward(from: 0.0);
      } else {
        animationController.reverse();
      }
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isAnimating = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context, listen: true);
    return MouseRegion(
      cursor: MouseCursor.uncontrolled,
      child: GestureDetector(
        onTap: _toggleThemeAndAnimate,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInCubic,
          width: isAnimating ? 50.0 : 40.0,
          height: isAnimating ? 50.0 : 40.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: RotationTransition(
            turns: Tween(
        begin: 0.0,
        end: isAnimating ? (widget.themeProvider.isDarkMode ? -0.25 : 0.50) : 0.0,
      ).animate(animationController),
            child: Icon(
              widget.themeProvider.isDarkMode ? LineIcons.sun : LineIcons.moon,
              color: themeProvider.WhiteAndBlack
            ),
          ),
        ),
      ),
    );
  }
}