import 'package:components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        children: const <Widget>[
          CustomCardType1(),
          CustomCardType2(
            imageText: 'Lake',
            imageUrl:
                'https://www.setaswall.com/wp-content/uploads/2017/06/Mountain-Landscape-Reflection-Mountains-3000-x-2000.jpg',
          ),
          CustomCardType2(
            imageText: 'Mountain',
            imageUrl: 'https://images3.alphacoders.com/714/714205.jpg',
          ),
          CustomCardType2(
            imageText: 'Tree',
            imageUrl:
                'https://s1.1zoom.me/big3/150/Switzerland_Mountains_Forests_Scenery_563563_3000x1920.jpg',
          ),
          CustomCardType2(
            imageUrl: 'https://images7.alphacoders.com/101/1011171.jpg',
          ),
        ],
      ),
    );
  }
}
