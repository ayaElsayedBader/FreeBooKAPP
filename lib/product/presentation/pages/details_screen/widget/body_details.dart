



import 'package:flutter/material.dart';

class  ColumnDetails extends StatelessWidget {
  const  ColumnDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      Column(
      children: [
        const Text(
          '  The Book Best  ',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        const Text(
          '  the Lion king  ',
          style:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber),
            Text('1325',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            Text(
              '(565)',
              style: TextStyle(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
