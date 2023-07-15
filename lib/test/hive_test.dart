import 'package:path_provider/path_provider.dart';

import 'package:hive_flutter/hive_flutter.dart';

Box? myBox;

Future<Box> opnBoxHived(String nameBox) async {
  if (!Hive.isBoxOpen(nameBox)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }

  return Hive.openBox(nameBox);
}


 Future< BoxCollection>openBoxCollection(Set < String>val) async{
  return  await  BoxCollection.open( 'animals' ,   val,
  path:   (await getApplicationDocumentsDirectory()).path);




 }