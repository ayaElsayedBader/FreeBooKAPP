import 'package:dartz/dartz.dart';
import 'package:ten_app/core/errors/failure.dart';
import 'package:ten_app/product/data/remote/data_sources/data_book.dart';
import 'package:ten_app/product/domain/repositories/rep_book.dart';

import '../../../core/conncation_net.dart';
import '../../domain/entities/entities_book.dart';
import '../local/data_sources/local_data_sourse.dart';
import '../model/book_model.dart';

class RepImp implements RepoBooks {
  final InForImp forImp;
  final ApiHelpersImp apiHelpersImp;
  final LocalDataImp localDataImp;

  RepImp(
      {required this.apiHelpersImp,
      required this.forImp,
      required this.localDataImp});

  @override
  Future<Either<Failure, List<BookEntities>>> getBook() async {
    if (await forImp.connected ) {
      try {
        var res = apiHelpersImp.getData();
        localDataImp.cashData(res);
        return res;
      } on Failure {
        return Left(ServerFailure(errors: 'not Data CASH'));
      }
    } else {
      try {
        final local = localDataImp.getData();
        return local;
      } on ServerFailure {
        return left(Failure(errors: 'not data in the app '));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getNewBook() {
    // TODO: implement getNewBook
    throw UnimplementedError();
  }
}
