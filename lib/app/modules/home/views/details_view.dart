import 'package:flutter/material.dart';
import 'package:flutterdex/app/domain/entities/pokemon.entity.dart';
import 'package:flutterdex/app/modules/home/controllers/home_controller.dart';
import 'package:flutterdex/app/widgets/poke_about.dart';
import 'package:flutterdex/app/widgets/poke_moves.dart';
import 'package:flutterdex/app/widgets/poke_stats.dart';
import 'package:flutterdex/app/widgets/type_card.dart';
import 'package:flutterdex/helpers/map_cardColor.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsView extends GetView<HomeController> {
  DetailsView({Key? key}) : super(key: key);
  RxInt _selectedIndex = 0.obs;

  Widget _buttonBuilder(Pokemon pokeData, String title, int myIndex) {
    return GestureDetector(
      onTap: () {
        _selectedIndex.value = myIndex;
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _selectedIndex.value == myIndex
              ? setTypeColor(pokeData.type1!)
              : const Color.fromARGB(0, 126, 119, 119),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: _selectedIndex.value == myIndex
                    ? Colors.white
                    : setTypeColor(pokeData.type1!),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pokeData = controller.pokemonItem.value;
      return Scaffold(
          appBar: AppBar(),
          backgroundColor: controller.isDetailsLoading.value
              ? Colors.white
              : setCardColor(pokeData?.type1),
          body: controller.isDetailsLoading.value ||
                  controller.pokemonItem.value == null
              ? Center(child: Image.asset('images/pokeLoad.gif'))
              : Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 6,
                      color: controller.isDetailsLoading.value
                          ? Colors.white
                          : setCardColor(pokeData?.type1!),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width / 4.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 35,
                          bottom: -50,
                          left: 35,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'images/pokeLoad.gif',
                            image: pokeData!.sprite!,
                            imageScale: 0.35,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              toBeginningOfSentenceCase(pokeData.name) ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              '#' + pokeData.id.toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (pokeData.type1 != null)
                                  TypeCard(pokeData.type1!),
                                if (pokeData.type2 != null) SizedBox(width: 10),
                                if (pokeData.type2 != null)
                                  TypeCard(pokeData.type2!),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 25,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: FittedBox(
                                child: Text(
                                  "${pokeData.description}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buttonBuilder(pokeData, 'ABOUT', 0),
                                _buttonBuilder(pokeData, 'STATS', 1),
                                _buttonBuilder(pokeData, 'MOVES', 2),
                              ],
                            ),
                            _selectedIndex.value == 0
                                ? Expanded(
                                    child: PokeAbout(pokeData),
                                  )
                                : _selectedIndex.value == 1
                                    ? PokeStats(pokeData)
                                    : Expanded(
                                        child: PokeMoves(pokeData),
                                      )
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
    });
  }
}
