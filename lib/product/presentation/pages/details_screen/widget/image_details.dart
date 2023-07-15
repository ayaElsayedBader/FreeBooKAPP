

import 'package:flutter/material.dart';
class ImageDetails extends StatelessWidget {
  const ImageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return       Container(
      decoration: BoxDecoration(
          color: Colors.green,
          image: const DecorationImage(
              image: NetworkImage(
                  'https://pm1.narvii.com/6806/1f252b68d73366c36ca2d572465e290d19361ff9v2_hq.jpg'),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height * .35,
      width: MediaQuery.of(context).size.width * .50,
    );
  }
}
