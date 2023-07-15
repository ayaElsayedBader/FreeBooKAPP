import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten_app/core/helper_ex.dart';
import 'package:ten_app/product/presentation/widgets/loading_widget.dart';
import '../../../../core/style_app/num_app.dart';
import '../../../../core/style_app/string_app.dart';
import '../../manager/book_cubit.dart';
import '../../manager/book_state.dart';
import '../details_screen/details_book_page.dart';
import 'build_item.dart';
import 'build_best_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<    BoolCubit, BoolState>(

      builder: (context, state) {
        if (state is BookSuccessState) {
          return Scaffold(              backgroundColor: Colors.black87,

            appBar: AppBar(
              backgroundColor: Colors.black87,
              actions: [
                IconButton(
                    onPressed: () {
                      context.navPush(const DetailsBookPage());
                    },
                    icon: const Icon(Icons.search))
              ],
              title: const Text(  StringApp.afm),
            ),
            body: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                       SizedBox(

                            height:NumApp.num200 ,
                            //  MediaQuery.of(context).size.height * .50,
                            child: ListView.separated(
                              itemCount:  NumApp.num10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return BuildItem(
                                  book: state.book[index],
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                                return Container( height: 50, color:  Colors.pink, width: 8,);
                            },
                            )),
                        const SizedBox(
                          height:  NumApp.num15,
                        ),
                        const Text(
                           StringApp.bestOffer,
                          style: TextStyle(color: Colors.red, fontSize: NumApp.num20),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),

                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<BoolCubit, BoolState>(
                    builder: (context, state) {
                      if (state is BookSuccessState) {
                       return  listItemP( state.book);
                      } else if ( state is BookErrorState) {
                        return      Center(child: Text( state.message));
                      }  else{
                        return const LoadingWidget();


                      }
                    },
                  ),
                )
              ]),

          );
        } else if (state is BookErrorState) {
          return Center(child: Text(state.message , style: const TextStyle( color: Colors.blue),) );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

// اللهم صل علي ممحمد وعلي ال محمد كما صليت علي ابراهيم وعلي ال ابراههيم في العالمين انك حميد مجيد الله اكببر بس الله ارحمن ارحيم
