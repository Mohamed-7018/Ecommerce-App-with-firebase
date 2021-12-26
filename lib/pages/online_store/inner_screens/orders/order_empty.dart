import 'package:flutter/material.dart';
import 'package:samir_online_store/pages/online_store/consts/colors.dart';
import 'package:samir_online_store/pages/online_store/feeds.dart';
import 'package:samir_online_store/widgets/navigation.dart';


class OrderEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage('https://image.flaticon.com/icons/png/128/3759/3759041.png',),
            ),
          ),
        ),
        Text(
          'Your order is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
            // ignore: deprecated_member_use
          color: Theme.of(context).textSelectionColor,
              fontSize: 36,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Looks Like You didn\'t \n order anything yet',
          textAlign: TextAlign.center,
          style: TextStyle(
              color:  ColorsConsts.subTitle,
              fontSize: 26,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {
              circularNavigate(
                context,
                page: Feeds(),
                offset: Offset(size.width / 2, size.height / 2),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.red),
            ),
            color: Colors.redAccent,
            child: Text(
              'Shop now'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                // ignore: deprecated_member_use
              color: Theme.of(context).textSelectionColor,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
