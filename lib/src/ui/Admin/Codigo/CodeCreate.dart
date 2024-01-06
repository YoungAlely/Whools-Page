import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whools/src/widgets/Widgets/ResponsiveWidget.dart';
import 'package:whools/src/widgets/Widgets/Texfield.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CodeCreate extends StatefulWidget {
  const CodeCreate({super.key});

  @override
  State<CodeCreate> createState() => _CodeCreateState();
}

class _CodeCreateState extends State<CodeCreate>
    with SingleTickerProviderStateMixin {
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _controller = TextEditingController();
  final TextEditingController _photoUrl = TextEditingController();
  final TextEditingController _gitrepo = TextEditingController();

  final _fromkey = GlobalKey<FormState>();
  bool _repoGit = false;
  final bool _isLoading = false;

  String? textMarkdown;
  String? titleT;
  String dropdownValue = list.first;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _titlecontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("1e1e1e"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Form(
                        key: _fromkey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 1),
                              tileColor: HexColor("1e1e1e"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: Text(
                                "Titulo",
                                style: GoogleFonts.montserrat(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    controller: _titlecontroller,
                                    decoration: InputDecoration(
                                        labelText:
                                            'Se conciso e imagina que estas explicando a una persona',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.grey[600]!)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.grey[600]!)),
                                        labelStyle:
                                            TextStyle(color: Colors.grey[400])),
                                    onChanged: (String text) {
                                      setState(() {
                                        titleT = text;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Este campo no puede estar vacio';
                                      }
                                      return null;
                                    },
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _photoUrl,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey[600]!)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey[400]!)),
                                  border: InputBorder.none,
                                  hintText: 'Url de la imagen(Portada)',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400]!,
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo no puede estar vacio';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              maxLines: null,
                              controller: _controller,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey[600]!)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey[400]!)),
                                  border: InputBorder.none,
                                  hintText: 'Escribe aqui en MarkDown',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400]!,
                                  )),
                              onChanged: (String text) {
                                setState(() {
                                  textMarkdown = text;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Este campo no puede estar vacio';
                                }
                                return null;
                              },
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Text(
                          "Categoria",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: DropdownMenu<String>(
                          initialSelection: list.first,
                          onSelected: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          dropdownMenuEntries: list
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        ),
                      ),
                      ListTile(
                        title: const Text("Link de Repositorio"),
                        trailing: Switch(
                          value: _repoGit,
                          onChanged: (newvalue) {
                            setState(() {
                              _repoGit = newvalue;
                            });
                          },
                        ),
                      ),
                      if (_repoGit) ...{
                        buildTextField(
                            controller: _gitrepo,
                            hintText: 'Url de repo',
                            errorText: 'errorText')
                      },
                    ],
                  ),
                ),
              ),
              ResponsiveWidget.isSmallScreen(context)
                  ? const SizedBox()
                  : Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: MarkdownBody(
                            styleSheet: MarkdownStyleSheet(
                                strong: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                codeblockDecoration: BoxDecoration(
                                  color: Colors
                                      .black, // Cambia el fondo del bloque de código
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                code: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    backgroundColor: Colors.transparent,
                                    color: Colors.grey[200])),
                            data: textMarkdown ?? "",
                          ))),
              if (_isLoading)
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.blueAccent,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Subiendo...",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        height: 30,
        child: ElevatedButton(
          onPressed: () {
            uploadCode(_titlecontroller.text, textMarkdown.toString(),
                _photoUrl.text, _gitrepo.text, dropdownValue);
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(HexColor("ffffff")),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
          child: Text(
            "Subir",
            style: GoogleFonts.silkscreen(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Future<void> uploadCode(String title, String markDown, String img,
      String repogit, String dropdownValue) async {
    if (_fromkey.currentState!.validate()) {
      try {
        if (title.isNotEmpty && markDown.isNotEmpty && img.isNotEmpty) {
          final Code = {
            'title': title,
            'markDown': markDown,
            'img': img,
            'linkrepo': repogit,
            'categoria': dropdownValue,
          };

          await FirebaseFirestore.instance.collection('Articles').add(Code);

          _titlecontroller.clear();
          _controller.clear();
          textMarkdown!.isEmpty;
          

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Código subido con éxito.'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('El título y el texto no pueden estar vacíos.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Error al subir el código. Por favor, inténtalo de nuevo.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al subir Por favor, inténtalo de nuevo.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
