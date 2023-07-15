

import 'package:equatable/equatable.dart';

import '../../domain/entities/entities_book.dart';



abstract class BoolState extends Equatable {
  const BoolState();
}

class BoolInitial extends BoolState {
  @override
  List<Object> get props => [];
}
class BookLoadingState extends  BoolState{
  @override

  List<Object?> get props =>  [];
}
class BookSuccessState extends  BoolState{

   final  List<BookEntities  >book;
  //
  //
  const BookSuccessState (  { required this.book});

  @override

  List<Object?> get props => [ book];
}    // Model
class BookErrorState extends  BoolState{
  final String message;
  const BookErrorState(   {   required this.message})
;
  @override
  List<Object?> get props => [message];
}
