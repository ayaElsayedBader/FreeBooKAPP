
import 'package:flutter/material.dart';


class RowDetails extends StatelessWidget {
 const  RowDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 30,
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: const Text('\$ 789',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            width: 150,
            height: 60,
            color: Colors.redAccent,
            // padding: EdgeInsets.all(15),
            child: const Text(' free Books',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
