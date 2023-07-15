import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/entities_book.dart';
import '../repositories/rep_book.dart';

class GetBookUseCase {
  RepoBooks repoBooks;

  GetBookUseCase({required this.repoBooks});

  Future<Either<Failure, List<BookEntities  >>> call() async {
    return await repoBooks.getBook();
  }
}
