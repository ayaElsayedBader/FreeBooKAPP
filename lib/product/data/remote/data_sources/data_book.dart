import 'dart:convert';

import 'package:dartz/dartz.dart';
  import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ten_app/core/errors/failure.dart';

import '../../../domain/entities/entities_book.dart';
import '../../model/book_model.dart';

String url =
    'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=newest%20&q=computer%20science';

abstract class ApiHelpers {
  Future<Either<Failure, List<BookEntities >>> getData();

}

class ApiHelpersImp implements ApiHelpers {
  http.Client client;

  ApiHelpersImp({required this.client});

  @override
  Future<Either<Failure, List<BookEntities >>> getData() async {
    var res = await client.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var decodedData = json.decode(res.body);
      List<dynamic> books =
          decodedData['items'];

      List<BookEntities > listData =
          books.map((book) => BookModel.fromJson(book)).toList();
      if (kDebugMode) {
        print(' صل علي سيدنا محمد');
      }
      return right(listData);
    } else {
      return left(Failure(errors: 'NotData'));
    }
  }
}


