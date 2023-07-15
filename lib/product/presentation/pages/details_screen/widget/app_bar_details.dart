

import 'package:flutter/material.dart';

import '../../search_page/search_screen.dart';

class AppBarDetails extends StatelessWidget {
  const AppBarDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.only(
        top: 40,
      ),
      child: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        color: Colors.black,
        child: Row(
          children:  [
            Icon(
              Icons.close,
              color: Colors.white,
            ),
            Spacer(),
           
            InkWell(
              onTap: (){
                Navigator.push(context,  MaterialPageRoute(builder: (context) =>  SearchScreen(),));
              },
              child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
            ),
        
          ],
        ),
      ),
    );
  }
}
