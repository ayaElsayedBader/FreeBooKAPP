import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return const ListTileShimmer(
          hasCustomColors: true,
          colors: [Color(0xFF1769aa), Color(0xFF4dabf5), Color(0xFF2196f3)],
        );
      },
    );
  }
}
