import 'package:carousel_slider/carousel_slider.dart';
import 'package:ten_app/product/presentation/manager/book_state.dart';
import 'package:ten_app/product/presentation/pages/details_screen/widget/app_bar_details.dart';
import 'package:ten_app/product/presentation/pages/details_screen/widget/body_details.dart';
import 'package:ten_app/product/presentation/pages/details_screen/widget/image_details.dart';
import 'package:ten_app/product/presentation/pages/details_screen/widget/row_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_app/product/presentation/widgets/loading_widget.dart';
import '../../../domain/entities/entities_book.dart';
import '../../manager/book_cubit.dart';
import '../home_page/build_item.dart';
import 'package:flutter/material.dart';

class DetailsBookPage extends StatelessWidget {
  const DetailsBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.black87,
        child: Column(
          children: [
            AppBarDetails(),
            const SizedBox(
              height: 15,
            ),
            ImageDetails(),
            const SizedBox(
              height: 15,
            ),
            ColumnDetails(),
            SizedBox(
              height: 15,
            ),
            RowDetails(),
            Padding(
              padding: EdgeInsets.only(top: 18, right: 140),
              child: Opacity(
                opacity: 0.6,
                child: Text(
                  'You can also like',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: BlocBuilder<BoolCubit, BoolState>(
                  builder: (BuildContext context, state) {
                if (state is BookSuccessState) {
                  return CarouselSlider(
                      options: CarouselOptions(
                        height: 150,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        reverse: true,
                        aspectRatio: 30,
                        scrollPhysics: ScrollPhysics(),
                        autoPlayCurve: Curves.linear,
                        // ارتفاع العنصر الفردي في السلايدر
                        enlargeCenterPage: true,
                        // زيادة حجم العنصر الحالي في الوسط
                        autoPlay: true,
                        // التمرير التلقائي للعناصر
                        autoPlayInterval: Duration(
                            seconds:
                                3), // فاصل زمني بين التمرير التلقائي للعناصر
                      ),
                      items: listItem(state.book));
                } else {
                  return LoadingWidget();
                }
              }),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> listItem(List<BookEntities> book) {
  return book.map((bookEntity) => BuildItem(book: bookEntity)).toList();
}
