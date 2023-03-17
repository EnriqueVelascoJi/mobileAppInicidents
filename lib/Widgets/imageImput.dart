import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'CarruselImaganes.dart';

class ImageInput extends StatefulWidget {
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  final List<Image> _ImagenesTomadas = [];
  File _storedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
  }

  void addImageCarousel() {
    setState(() {
      _ImagenesTomadas.add(Image.file(
        _storedImage,
        fit: BoxFit.cover,
        width: double.infinity,
      ));
      _storedImage = null;
    });
  }

  Widget buildCarrusel() {
    setState(() {
      CarouselImages(_ImagenesTomadas);
    });
    return CarouselImages(_ImagenesTomadas);
  }

  @override
  Widget build(BuildContext context) {
    /* _ImagenesTomadas.add(Image.asset(
      'assets/images/im2.PNG',
      fit: BoxFit.cover,
      width: double.infinity,
    ));*/
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: _storedImage != null
                      ? Image.file(
                          _storedImage,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : Text(
                          'No imagenes tomadas',
                          textAlign: TextAlign.center,
                        ),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton.icon(
                  icon: Icon(Icons.camera),
                  label: Text(
                    'Tomar Foto',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: _takePicture,
                ),
              ],
            ),
            TextButton.icon(
              icon: Icon(Icons.add_a_photo),
              label: Text(
                'Agregar Foto',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: addImageCarousel,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: _ImagenesTomadas.isEmpty
                  ? Text('No se han agregado fotos')
                  : CarouselImages(_ImagenesTomadas),
            ),

            /* SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CarouselImages(_ImagenesTomadas),
              ),
            ),*/
          ],
        ),
      ],
    );
  }
}
