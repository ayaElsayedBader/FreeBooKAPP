import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_app/product/domain/entities/entities_book.dart';
import 'package:ten_app/product/presentation/manager/book_cubit.dart';
import 'package:ten_app/product/presentation/pages/splash_sceean/splash_page.dart';
import 'core/bloc_obs.dart';
import 'core/ingaction.dart' as li;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntitiesAdapter());
  await Hive.openBox<BookEntities>('BoxName');
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await li.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => li.sl<BoolCubit>()..getData(),
      child: MaterialApp(
        home: const SplashScreen(),
        theme: ThemeData(fontFamily: "mons"),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
