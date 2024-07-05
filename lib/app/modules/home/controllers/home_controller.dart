import 'package:flutter/material.dart';
import 'package:flutterdex/app/domain/entities/pagination.entity.dart';
import 'package:flutterdex/app/domain/entities/pokemon.entity.dart';
import 'package:flutterdex/app/domain/usecases/pokedex_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Pagination pagination = Pagination();
  final ScrollController scrollController = ScrollController();

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      nextPage();
    }
  }

  //STATES

  final isHomeLoading = false.obs;
  final isDetailsLoading = false.obs;
  final pokemons = <Pokemon>[].obs;
  final pokemonItem = Rxn<Pokemon>();

  //DI
  final _useCase = Get.find<PokedexUsecase>();

  //METHODS
  getPokemons() async {
    isHomeLoading.value = true;
    final result = await _useCase.getPokemons();
    pokemons.addAll(result);
    isHomeLoading.value = false;
  }

  getDetails(String id) async {
    pokemonItem.value = null;
    isDetailsLoading.value = true;
    final result = await _useCase.getPokemon(id);
    pokemonItem.value = result;
    isDetailsLoading.value = false;
  }

  nextPage() async {
    pagination.nextPage();
    final result = await _useCase.getPokemons(offset: pagination.currentOffset);
    pokemons.addAll(result);
  }

  @override
  void onInit() {
    getPokemons();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    super.onClose();
  }
}
