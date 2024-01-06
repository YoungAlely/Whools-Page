import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icon.dart';
import 'package:whools/src/widgets/Widgets/DateInputField.dart';
import 'package:whools/src/widgets/Widgets/Texfield.dart';
import 'package:whools/src/widgets/Widgets/TimeWidget.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  bool imageAvailable = false;

  final _formkey = GlobalKey<FormState>();
  final _titulo = TextEditingController();
  final _descriptioncontroller = TextEditingController();
  final _fechaInicio = TextEditingController();
  final _fechaFinal = TextEditingController();
  TimeOfDay? _horainicio;
  TimeOfDay? _horaFinal;
  final _urlEvento = TextEditingController();
  final _ubicacionController = TextEditingController();
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  bool urlRegistro = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final scrennSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: SizedBox(
                          width: scrennSize.width,
                          height: 500,
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => _pickImage(),
                                  child: Container(
                                    height: 100,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10),
                                    ),
                                    child: imageAvailable
                                        ? kIsWeb
                                            ? Image.memory(webImage)
                                            : Image.file(_pickedImage!)
                                        : Container(
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child:const  Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                LineIcon.camera(
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Sube foto del evento",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                  ),
                                ),
                             const    SizedBox(height: 30),
                                Row(
                                  children: [
                                    Expanded(
                                      child: buildTextField(
                                          controller: _ubicacionController,
                                          hintText: "Ubicacion del evento",
                                          errorText:
                                              "Ingresa una Ubicacion"),
                                    ),
                                const     SizedBox(width: 10),
                                    Expanded(
                                      child: buildTextField(
                                          controller: _titulo,
                                          hintText: "Titulo del evento",
                                          errorText: "Ingresa un titulo"),
                                    ),
                                  ],
                                ),
                             const    SizedBox(height: 10),
                                buildTextField(
                                    maxLines: 4,
                                    controller: _descriptioncontroller,
                                    hintText: 'Descripción del Evento',
                                    errorText: 'Ingresa la descripción'),
                             const    SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DateInputField(
                                        controller: _fechaInicio,
                                        hintText: 'Fecha inicio del evento',
                                        validator: (value) {
                                          if (value != null ||
                                              value!.isEmpty) {
                                            return 'Es necesaria la Fecha de Inicio';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                const     SizedBox(width: 10),
                                    Expanded(
                                      child: DateInputField(
                                        controller: _fechaFinal,
                                        hintText: 'Fecha final del evento',
                                        validator: (value) {
                                          if (value != null ||
                                              value!.isEmpty) {
                                            return 'Es necesaria la Fecha de Inicio';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                               const  SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                        child: TimeInputField(
                                            controller:
                                                TextEditingController(
                                              text: _horainicio != null
                                                  ? _horainicio!
                                                      .format(context)
                                                  : '',
                                            ),
                                            onTap: (context) =>
                                                _HoraInicio(context),
                                            hintText: 'Hora de inicio')),
                               const      SizedBox(width: 10),
                                    Expanded(
                                        child: TimeInputField(
                                            controller:
                                                TextEditingController(
                                              text: _horaFinal != null
                                                  ? _horaFinal!
                                                      .format(context)
                                                  : '',
                                            ),
                                            onTap: (context) =>
                                                _HoraFinal(context),
                                            hintText: 'Hora final')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("URL DE REGISTO"),
                    Switch(
                      trackColor: const MaterialStatePropertyAll(Colors.white),
                      thumbColor: const MaterialStatePropertyAll(Colors.white),
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.red,
                      value: urlRegistro,
                      onChanged: (newValue) {
                        setState(() {
                          urlRegistro = newValue;
                        });
                      },
                    ),
                  ],
                ),
                if (urlRegistro) ...{
                  buildTextField(
                      controller: _urlEvento,
                      hintText: 'Url del evento',
                      errorText: ''),
                },
                if (loading)
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.red,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Subiendo Evento",
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              _UploadEvent();
            },
            backgroundColor: Colors.blueAccent,
            label: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LineIcon.upload(
                  color: Colors.white,
                ),
                Text("Subir Eventos")
              ],
            ),
          ),
        ));
  }

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
          imageAvailable = true;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No seleccionaste una imagen")));
      }
    } else if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
          imageAvailable = true;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No seleccionaste una imagen")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("¿?")));
    }
  }

  Future<void> _HoraInicio(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
        _horainicio = picked;
      });
    }
  }

  Future<void> _HoraFinal(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
        _horaFinal = picked;
      });
    }
  }

  void _UploadEvent() async {
    setState(() {
      loading = true;
    });
    if (_formkey.currentState!.validate() &&
        _pickedImage != null &&
        webImage.isNotEmpty) {
      final ubicacion = _ubicacionController.text;
      final titulo = _titulo.text;
      final description = _descriptioncontroller.text;
      final fechaInicio = _fechaInicio.text;
      final fechaFinal = _fechaFinal.text;
      final urlEvento = _urlEvento.text;
      final imageFilename = '${DateTime.now().microsecondsSinceEpoch}.jpg';
      final firebaseStorageRef =
          FirebaseStorage.instance.ref().child('Eventos/$imageFilename');

      try {
        await firebaseStorageRef.putData(webImage);
        final imageUrl = await firebaseStorageRef.getDownloadURL();

        final now = DateTime.now();
        final fechaHoraFinal =
            '${_fechaFinal.text} ${_horaFinal!.hour.toString().padLeft(2, '0')}:${_horaFinal!.minute.toString().padLeft(2, '0')}';

        final events = {
          'ubicacion': ubicacion,
          'titulo': titulo,
          'description': description,
          'fechaInicio': fechaInicio,
          'fechaFinal': fechaFinal,
          'HoraInicio':
              '${_horainicio!.hour.toString().padLeft(2, '0')}:${_horainicio!.minute.toString().padLeft(2, '0')}',
          'HoraFin':
              '${_horaFinal!.hour.toString().padLeft(2, '0')}:${_horaFinal!.minute.toString().padLeft(2, '0')}',
          'urlEvento': urlEvento,
          'imageUrl': imageUrl,
          'fechaHoraFinal': fechaHoraFinal,
        };
        await FirebaseFirestore.instance.collection('Events').add(events);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Evento subido con éxito"),
        ));

        _titulo.clear();
        _ubicacionController.clear();
        _descriptioncontroller.clear();
        _fechaInicio.clear();
        _fechaFinal.clear();
        _horainicio = null;
        _horaFinal = null;

        setState(() {
          imageAvailable = false;
          loading = false;
        });
      } catch (e) {
        setState(() {
          loading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          elevation: 10,
          content: Text("Error al subir el evento $e"),
        ));
      }
    }
  }
}
