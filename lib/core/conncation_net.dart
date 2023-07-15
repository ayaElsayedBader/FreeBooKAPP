


import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class Information {
  Future<bool> get connected;
}

class InForImp extends Information {
  InternetConnectionChecker connectionChecker;

  InForImp({   required this.connectionChecker});

  @override
  Future<bool> get connected => connectionChecker.hasConnection;
}
