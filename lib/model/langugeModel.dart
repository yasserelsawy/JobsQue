import '../view/widgets/assets.dart';

class Languge {
  String image;
  String name;
  Languge({required this.image, required this.name});

  static List<Languge> lang = [
    Languge(image: (AppAssets.England), name: "English"),
    Languge(image: (AppAssets.Indonesia), name: "Indonesia"),
    Languge(image: (AppAssets.SaudiArabia), name: "Arabic"),
    Languge(image: (AppAssets.China), name: "Chinese"),
    Languge(image: (AppAssets.Indonesia), name: "Dutch"),
    Languge(image: (AppAssets.France), name: "French"),
    Languge(image: (AppAssets.Germany), name: "German"),
    Languge(image: (AppAssets.Japan), name: "Japanese"),
    Languge(image: (AppAssets.SouthKorea), name: "Korean"),
    Languge(image: (AppAssets.Portugal), name: "Portuguese"),
  ];
}
