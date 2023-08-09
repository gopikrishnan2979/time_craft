import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/controller/debouncer/debouncer.dart';
import 'package:time_craft/model/firebase_instance_model.dart';

//Search controller for controlling the search as the user needed
class SearchProvider extends ChangeNotifier {
  String text = '';
  bool isfilterapplied = false;
  String selectedId = '';
  int selectedIndex = 100;

//uses debouncer for makeing a delay for as the user type the request will not made
// as the user stops typing the request is send
  final Debouncer _debouncer = Debouncer(milliseconds: 800);
  List<QueryDocumentSnapshot<Object?>> searchlist = [];
  search(String value) {
    text = value;
    searchValue();
  }

//------------------apply filter to the search functionality
  applyfilter(int index, String id) {
    isfilterapplied = true;
    selectedIndex = index;
    selectedId = id;
    notifyListeners();
    searchValue();
  }

//-----------------remove the filter for the search functionality
  removeFilter() {
    isfilterapplied = false;
    selectedIndex = 100;
    selectedId = '';
    notifyListeners();
    searchValue();
  }

//----------------search the value according to the user
  searchValue() {
    _debouncer.run(
      action: () async {
        if (text != '') {
          try {
            searchlist =
                await FirebaseInstances.products.get().then((value) => value.docs.where((element) {
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
            return false;
          }
        } else {
          searchlist = [];
        }
        notifyListeners();
      },
    );
  }
}
