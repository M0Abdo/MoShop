import 'package:flutter/material.dart';

import '../../../Controller/imgAssets.dart';

class Img extends StatelessWidget {
  const Img({super.key});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(ImgAsset.onBoardingImg,height: MediaQuery.of(context).size.height/2,);
  }
}