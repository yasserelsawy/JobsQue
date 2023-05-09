import '../view/widgets/assets.dart';

class GeneralModel {
  String image;
  String name;

  GeneralModel({required this.image, required this.name});

  static List<GeneralModel> data = [
    GeneralModel(
      image: (AppAssets.profile2),
      name: "Edit Profile",
    ),
    GeneralModel(
      image: (AppAssets.favorite),
      name: "Portfolio",
    ),
    GeneralModel(
      image: (AppAssets.global),
      name: "Langauge",
    ),
    GeneralModel(
      image: (AppAssets.notification),
      name: "Notification",
    ),
    GeneralModel(
      image: (AppAssets.lock2),
      name: "Login and security",
    ),
  ];
}
