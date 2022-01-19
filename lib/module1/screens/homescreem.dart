import 'package:excelledia/module1/components/imagewidget.dart';
import 'package:excelledia/module1/controllers/controller.dart';
import 'package:excelledia/module1/screens/fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControler(), permanent: true);

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomePageControler>(builder: (_ctr) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _ctr.ctr,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Type in your text",
                            fillColor: Colors.white70),
                      ),
                    ),
                    TextButton.icon(
                        label: const Text('Search'),
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          _ctr.homepageapi(_ctr.ctr.text, 1, false);
                          Get.focusScope!.unfocus();
                        })
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Search Results'),
                const SizedBox(
                  height: 20,
                ),
                _ctr.ctr.text.isEmpty
                    ? const Center(child: Text('Enter a search key'))
                    : _ctr.homePageLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _ctr.homepagdata!.hits!.isEmpty
                            ? const Center(child: Text('No data found'))
                            : Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  controller: _ctr.controller,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: _ctr.homepagdata!.hits!.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index ==
                                        _ctr.homepagdata!.hits!.length) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      return InkWell(
                                        onTap: () {
                                          Get.focusScope!.unfocus();
                                          Get.to(Hero(
                                            tag: _ctr.homepagdata!.hits![index]
                                                .previewUrl!,
                                            child: FullScreen(
                                              url: _ctr.homepagdata!
                                                  .hits![index].previewUrl!,
                                            ),
                                          ));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5,
                                              right: 5,
                                              top: 2.5,
                                              bottom: 5),
                                          child: Column(
                                            children: [
                                              ImageWidget(
                                                height: Get.height * .25,
                                                radius: 12,
                                                width: Get.width,
                                                url: _ctr.homepagdata!
                                                    .hits![index].previewUrl!,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  // ),
                                ),
                              ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
