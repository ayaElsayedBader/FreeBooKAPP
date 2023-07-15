import 'package:flutter/material.dart';

import '../../../../core/style_app/num_app.dart';
import '../../../domain/entities/entities_book.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  final BookEntities book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: NumApp.val5, top: NumApp.val5, bottom: NumApp.val5),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Container(
          //   height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(NumApp.num15),
            // width: 150,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(book.image),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: NumApp.num20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  book.bookId,
                  style: const TextStyle(color: Colors.black87),
                ),
                Text(book.rating.toString(),
                    style: const TextStyle(
                        color: Colors.purple,
                        fontSize: NumApp.num17,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
