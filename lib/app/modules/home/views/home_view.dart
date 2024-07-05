import 'package:flutter/material.dart';
import 'package:flutterdex/app/modules/home/views/details_view.dart';
import '../../../widgets/home_search.dart';
import '../../../widgets/poke_card.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: HomeSearch(),
                ),
                Obx(() => controller.isHomeLoading.value
                    ? Center(child: Image.asset('images/pokeLoad.gif'))
                    : RefreshIndicator(
                        onRefresh: () async {
                          await controller.getPokemons();
                        },
                        child: Column(
                          children: controller.pokemons
                              .map((item) => PokeCard(item, onTap: () {
                                    if (item.id != null) {
                                      controller.getDetails(item.id!);
                                      Get.to(() => DetailsView(),
                                          arguments: item);
                                    }
                                  }))
                              .toList(),
                        ),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
