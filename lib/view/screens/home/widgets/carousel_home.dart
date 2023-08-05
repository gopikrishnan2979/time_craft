import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseInstances.banners.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Loading();
          }
          if (snapshot.data!.docs.isEmpty) {
            return const SizedBox();
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
                color: Colors.grey,
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)],
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Image.network(
                item['image'],
                fit: BoxFit.cover,
                width: kwidth,
                height: khieght,
                errorBuilder: (context, error, stackTrace) => SizedBox(
                  width: kwidth * 0.8,
                  height: khieght * 0.3,
                  child: errorShower(),
                ),
              ),
            ))
        .toList();
  }
}
