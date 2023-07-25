import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/core/styles.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseInstanceModel.banners.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Text('...Loading');
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Text('...Empty');
          }
          return CarouselSlider(
            options: CarouselOptions(aspectRatio: 1.7, enlargeCenterPage: true),
            items: bannerBuilder(bannerList: snapshot.data!.docs),
          );
        });
  }

  bannerBuilder({required List<QueryDocumentSnapshot<Object?>> bannerList}) {
    return bannerList
        .map((item) => Container(
              decoration: const BoxDecoration(
                  color: white, boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)]),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Image.network(
                item['image'],
                fit: BoxFit.cover,
                width: kwidth,
                height: khieght,
              ),
            ))
        .toList();
  }
}
