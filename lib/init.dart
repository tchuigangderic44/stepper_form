// La directive part of permet de diviser une bibliothèque unique en plusieurs fichiers. Elle est utile lorsque vous disposez d'une grande bibliothèque contenant de nombreuses classes et fonctions et que vous souhaitez les organiser en fichiers plus petits et plus faciles à gérer. Chaque fichier faisant partie de la bibliothèque doit inclure la directive part of, qui spécifie le nom de la bibliothèque.
part of 'main.dart';

///
///Init all the dependancy of the project in the container
///
Future setupDependency(bool withAsync) async {
  _initializeInjectionDependency(true);
  disposeDependency();
}

void _initializeInjectionDependency(bool lazylly) {
  Get.lazyPut<AppColors>(() => AppColors(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
}

void disposeDependency() {
  Get.deleteAll(force: true);
}
