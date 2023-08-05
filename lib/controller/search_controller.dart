import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/controller/debouncer.dart';
import 'package:time_craft/model/firebase_instance_model.dart';

class SearchProvider extends ChangeNotifier {
  String text = '';
  bool isfilterapplied = false;
  String selectedId = '';
  int selectedIndex = 100;

  final Debouncer _debouncer = Debouncer(milliseconds: 800);
  List<QueryDocumentSnapshot<Object?>> searchlist = [];
  search(String value) {
    text = value;
    searchValue();
  }

  applyfilter(int index, String id) {
    isfilterapplied = true;
    selectedIndex = index;
    selectedId = id;
    notifyListeners();
    searchValue();
  }

  removeFilter() {
    isfilterapplied = false;
    selectedIndex = 100;
    selectedId = '';
    log(selectedId);
    notifyListeners();
    searchValue();
  }

  searchValue() {
    _debouncer.run(action: () async {
      if (text != '') {
        try {
          searchlist = await FirebaseInstanceModel.products
              .get()
              .then((value) => value.docs.where((element) {
                    log(element['brand']);
                    var name = element['name'] as String;
                    var brandId = element['brand'] as String;
                    if (isfilterapplied) {
                      if (name.toLowerCase().contains(text.toLowerCase().trim()) &&
                          brandId == selectedId) {
                        return true;
                      }
                    } else {
                      if (name.toLowerCase().contains(text.toLowerCase().trim())) {
                        return true;
                      }
                    }
                    return false;
                  }).toList());
        } catch (_) {
          log(_.toString());
          return false;
        }
      } else {
        searchlist = [];
      }

      notifyListeners();
    });
  }
}
