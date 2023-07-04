import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';

final List<String> imgList = [
  'https://img.freepik.com/free-photo/black-friday-sales-elements-assortment-with-copy-space_23-2148665617.jpg',
  'https://img.freepik.com/free-photo/black-friday-concept-with-space-middle-alarm-clock_23-2147695920.jpg',
  'https://img.freepik.com/free-vector/online-shopping-flyer-square_23-2148748037.jpg',
  ];

class CarouselHome extends StatelessWidget {
  CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          aspectRatio: 1.7,
          enlargeCenterPage: true),
      items: imageSliders,
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            decoration: const BoxDecoration(
                color: white,
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)]),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Image.network(
              item,
              fit: BoxFit.cover,
              width: kwidth,
              height: khieght,
            ),
          ))
      .toList();
}
