// ignore_for_file: avoid_print, deprecated_member_use

import 'package:excelledia/module1/models/searchmodel.dart';
import 'package:excelledia/services/httpservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class HomePageControler extends GetxController {
  bool homePageLoading = false;
  ScrollController controller = ScrollController();
  TextEditingController ctr = TextEditingController();
  int pageno = 1;
  String searchkey = '';
  Searchmodel? homepagdata;
  List<Hit>? paginateddata = [];

  @override
  void onInit() {
    super.onInit();
    addItems();
  }

  addItems() async {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        pageno++;
        homepageapi(ctr.text, pageno, true);
      }
    });
  }

  homepageapi(String seastring, int pno, bool pagination) async {
    if (pagination == false) {
      homePageLoading = true;
      update();
    }
    // ignore: unused_local_variable
    http.Response? response = await HttpService().getApi(
        url:
            'https://pixabay.com/api/?key=25319619-290b1e24ced6a1d4710411550&q=$seastring&image_type=photo&page=$pno');
    if (pagination) {
      print('its working');
      try {
        Searchmodel? dummydata;
        dummydata = searchmodelFromJson(response!.body);
        homepagdata!.hits!.addAll(dummydata.hits!);

        update();
      } catch (e) {
        print(e);
      }
    } else {
      try {
        homepagdata = searchmodelFromJson(response!.body);

        print(homepagdata!.hits!.length);
      } catch (e) {
        print(e);
      }
    }
    if (pagination == false) {
      homePageLoading = false;
      update();
    }
  }
}
