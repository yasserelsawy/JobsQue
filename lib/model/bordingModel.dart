import 'package:flutter/cupertino.dart';

import '../view/widgets/assets.dart';

class BoardingModel {
  late final String image;
  late final String title;

  BoardingModel({
    required this.image,
    required this.title,
  });
}

final List<BoardingModel> boardingList = [
  BoardingModel(
    image: AppAssets.onbording1,
    title: AppAssets.titleOnbording1,
  ),
  BoardingModel(
    image: AppAssets.onbording2,
    title: AppAssets.titleOnbording2,
  ),
  BoardingModel(
    image: AppAssets.onbording3,
    title: AppAssets.titleOnbording3,
  ),
];
