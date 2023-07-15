


class  Failure{

  final String errors;
  Failure( { required this.errors});
}
class ServerFailure extends Failure{
  ServerFailure({required super.errors});

}