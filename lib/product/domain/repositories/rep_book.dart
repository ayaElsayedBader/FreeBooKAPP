import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/entities_book.dart';

abstract class RepoBooks {
  Future<Either<Failure, List<BookEntities >>> getBook();

  Future<Either<Failure, List<BookEntities >>> getNewBook();
}

// اللهم صل علي محمد وعلي ال محمد كما صليت علي ابراهيم وعلي ال ابراهيم في العالمين انك حميد مجيد اللهم صل علي محمد وعلي ال محمد كما صليت علي ابرااهيم معلي ال ابراهيم في العالمين انك حييد مجيد