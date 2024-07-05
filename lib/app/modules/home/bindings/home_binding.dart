import 'package:flutterdex/app/data/repositories/pokeapi.repository.dart';
import 'package:flutterdex/app/data/sources/remoto/pokeapi.remoto.dart';
import 'package:flutterdex/app/domain/repositories/pokedex.repository.dart';
import 'package:flutterdex/app/domain/usecases/pokedex_usecase.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    //remoto
    Get.lazyPut<PokeApiRemoto>(() => PokeApiRemoto());

    //repository
    Get.lazyPut<IPokeApiRepository>(
        () => PokeApiRepository(pokeApiRemoto: Get.find()));

    //usecase
    Get.lazyPut<PokedexUsecase>(
        () => PokedexUsecase(Get.find<IPokeApiRepository>()));
  }
}
