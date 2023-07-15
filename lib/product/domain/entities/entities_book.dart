import 'package:hive/hive.dart';

part 'entities_book.g.dart';

@HiveType(typeId: 0)
class BookEntities {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final num price;
  @HiveField(4)
  final num rating;
  @HiveField(5)
  final String bookId;

  BookEntities(
      {required this.image,
      required this.title,
      required this.author,
      required this.price,
      required this.rating,
      required this.bookId});
}
