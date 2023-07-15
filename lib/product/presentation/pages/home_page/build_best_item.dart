import 'package:flutter/material.dart';

import '../../../../core/style_app/num_app.dart';
import '../../../domain/entities/entities_book.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BuildBestItem extends StatelessWidget {
  const BuildBestItem({Key? key, required this.book}) : super(key: key);
  final BookEntities book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: SizedBox(
          width: double.infinity,
          height: 160,
          child: Row(
            children: [
              Container(
                height: 200,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          book.image,
                        ),
                        fit: BoxFit.cover)),
              ),
              sizeW25,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: NumApp.num150,
                      child: Text(
                        book.author,
                        maxLines: 4,
                        style: const TextStyle(
                            height: 1.5,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            //    fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontFamily: 'asset/font/Montserrat-Black.ttf'),
                      ),
                    ),
                    sizeH10,
                    SizedBox(
                      width: 120,
                      child: Text(
                        book.title,
                        maxLines: 3,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(book.price.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24)),
                          const SizedBox(
                            width: 40,
                          ),
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(book.rating.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget listItemP(List<BookEntities> book) {
  return SizedBox(
    child: ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return BuildBestItem(book: book[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.all(10),
          child: Divider(
            thickness: 20,
            color: Colors.grey,
          ),
        );
      },
      itemCount: book.length,
    ),
  );
}
