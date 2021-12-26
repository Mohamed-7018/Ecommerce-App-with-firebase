import 'package:flutter/material.dart';
import 'package:samir_online_store/constants.dart';
import 'package:samir_online_store/widgets/blur_filter.dart';



class EmptyBrandCard extends StatelessWidget {
  final String text;

  const EmptyBrandCard({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlurFilter(
      borderRadius: BorderRadius.circular(20),
      sigma: 8,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Constants.color2.withOpacity(0.3),
          // border: Border.all(color: Constants.color2, width: 2),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6.copyWith(height: 2),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
