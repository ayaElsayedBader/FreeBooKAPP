







import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../../core/errors/failure.dart';
import '../../../domain/entities/entities_book.dart';

abstract class LocalData {
  Future<Either<Failure, List<BookEntities>>> getData();

  Future<Either<Failure, List<BookEntities>>> cashData(
      Future<Either<Failure, List<BookEntities>>> book);
}

class LocalDataImp implements LocalData {
  @override
  Future<Either<Failure, List<BookEntities>>> cashData(
      Future<Either<Failure, List<BookEntities>>> book) async {
    var box = Hive.box('BoxName');
    var result = await book;
    result.fold((failure) => "معالجة الفشل هنا في حالة حدوثه",
            (bookList) => box.addAll(bookList));

    return result;
  }

  @override
  Future<Either<Failure, List<BookEntities>>> getData() async {
    try {
      var box = Hive.box<BookEntities>('BoxName');
      var res = box.values.toList();
      return right(res);
    } catch (e) {
      return Left(Failure(errors: e.toString()));
    }
  }
}
