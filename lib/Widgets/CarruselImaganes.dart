import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImages extends StatelessWidget {
  final List<Image> _ImagenesTomadas;
  CarouselImages(this._ImagenesTomadas);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: CarouselSlider.builder(
          options: CarouselOptions(height: 200.0),
          itemCount: _ImagenesTomadas.length,
          itemBuilder: (context, index, realIndex) {
            return buildImage(_ImagenesTomadas[index], index);
          },
        ),
      ),
    );
  }
}

Widget buildImage(Image elementCarrusel, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.amber,
      child: elementCarrusel,
    );
