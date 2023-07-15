

import 'package:flutter/material.dart';

import 'list_aduio.dart';
import 'modl_aduio.dart';
class AudioPage extends StatelessWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(),
      body:    SizedBox(   height: 400,
        child: ListView.builder(

          itemCount: link.length,
          itemBuilder: (context, index) {
          return  ModelAduio( name: name[index], url: link[index],);
        },),
      ),
    );
  }
}





