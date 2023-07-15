import 'package:flutter/material.dart';

import '../../../../core/style_app/num_app.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      color: Colors.black,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              Padding(
                padding:
                   const EdgeInsets.symmetric(horizontal:  NumApp.num20 ,vertical: NumApp.num20),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(NumApp.num20 ),
                        borderSide: const BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(NumApp.num20 ),
                        borderSide: const BorderSide(color: Colors.white)),
                  ),
                ),
              )
            ]),
          ),
          SliverToBoxAdapter(
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container();
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: 100),
          ),
        ],
      ),
    ));
  }
}
