import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/entities_book.dart';
import '../repositories/rep_book.dart';

class GetNowBookUseCase {
  RepoBooks repoBooks;

  GetNowBookUseCase({required this.repoBooks});

  Future<Either<Failure, List<BookEntities >>> call() async {
    return await repoBooks.getNewBook();
  }
}




