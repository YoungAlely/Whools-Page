import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whools/src/ui/Admin/AdminMobile.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ResponsiveWidget.isSmallScreen(context)
                      ? SizedBox()
                      : Expanded(
                          child: Container(
                          child: CachedNetworkImage(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height,
                              imageUrl:
                                  "https://media.giphy.com/media/IgLIVXrBcID9cExa6r/giphy.gif"),
                        )),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              labelText: 'Correo',
                              labelStyle:
                                  GoogleFonts.silkscreen(color: Colors.white),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.grey[400]!)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Porfavor ingresa el correo';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !isVisible,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey[400]!)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                labelText: 'Contaseña',
                                labelStyle:
                                    GoogleFonts.silkscreen(color: Colors.white),
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    icon: Icon(
                                      isVisible
                                          ? FontAwesomeIcons.eyeSlash
                                          : FontAwesomeIcons.eye,
                                      color: Colors.white,
                                    ))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Porfavor ingresa la contraseña';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0),
                          _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      try {
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        );
                                         // ignore: use_build_context_synchronously
                                         Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AdminMobile()));
                                      } on FirebaseAuthException catch (e) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                        if (e.code == 'user-not-found') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'No user found for that email.'),
                                            ),
                                          );
                                        } else if (e.code == 'wrong-password') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Wrong password provided for that user.'),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'An error occurred. Please try again later.'),
                                            ),
                                          );
                                        }
                                      }
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.white),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      textStyle: MaterialStatePropertyAll(
                                          GoogleFonts.silkscreen(
                                              color: Colors.black))),
                                  child: Text(
                                    'Iniciar sesión',
                                    style: GoogleFonts.silkscreen(
                                        color: Colors.black),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
