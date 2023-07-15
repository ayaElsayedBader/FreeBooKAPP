


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_book_use_case.dart';
import 'book_state.dart';

class BoolCubit extends Cubit<BoolState> {
  BoolCubit({required this.getBookUseCase}) : super(BoolInitial());

  BoolCubit get(context) => BlocProvider.of(context);

  final GetBookUseCase getBookUseCase;

  void getData() async {
    emit(BookLoadingState());
    var res = await getBookUseCase.call();
    res.fold((l) => emit(BookErrorState(message: l.errors.toString())),
        (r) => emit(BookSuccessState(book: r)));
  }
}
