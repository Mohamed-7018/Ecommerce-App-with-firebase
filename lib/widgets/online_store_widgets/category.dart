import 'package:flutter/material.dart';
import 'package:samir_online_store/constants.dart';
import 'package:samir_online_store/pages/online_store/inner_screens/categories_feeds.dart';

import '../navigation.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Phones',
      'categoryImagesPath': 'assets/images/CatPhones.png',
    },
    {
      'categoryName': 'Clothes',
      'categoryImagesPath': 'assets/images/CatClothes.jpg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImagesPath': 'assets/images/CatShoes.jpg',
    },
    {
      'categoryName': 'Beauty&Health',
      'categoryImagesPath': 'assets/images/CatBeauty.jpg',
    },
    {
      'categoryName': 'Laptops',
      'categoryImagesPath': 'assets/images/CatLaptops.png',
    },
    {
      'categoryName': 'Furniture',
      'categoryImagesPath': 'assets/images/CatFurniture.jpg',
    },
    {
      'categoryName': 'Watches',
      'categoryImagesPath': 'assets/images/CatWatches.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //categories[widget.index]['categoryImagesPath']
    //categories[widget.index]['categoryName']
    // circularNavigate(
    // context,
    // page: CategoriesFieldsScreens(
    // categoryName: '${categories[widget.index]['categoryName'].toString()}' ,
    // ),
    // offset: Offset(size.width / 2, size.height / 2),
    // );
    return  InkWell(
      onTap: () {
        circularNavigate(
          context,
          page: CategoriesFieldsScreens(
            categoryName:
                '${categories[widget.index]['categoryName'].toString()}',
          ),
          offset: Offset(size.width / 2, size.height / 2),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.8,
              child: Container(
                width: (MediaQuery.of(context).size.width - 60) / 2,
                height: 240,
                decoration: BoxDecoration(
                  color: Constants.color2,
                  image: DecorationImage(image: AssetImage(categories[widget.index]['categoryImagesPath']), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Container(
              height: 45,
              width: (MediaQuery.of(context).size.width - 60) / 2,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink[700], width: 2),
                color: Constants.kCustomsColor.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 10,bottom: 10, right: 10, left: 10),
                  child: Text(
                    categories[widget.index]['categoryName'],
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

    //   Stack(
    //   children: [
    //     InkWell(
    //       onTap:  () {
    //         circularNavigate(
    //           context,
    //           page: CategoriesFieldsScreens(
    //             categoryName: '${categories[widget.index]['categoryName'].toString()}' ,
    //           ),
    //           offset: Offset(size.width / 2, size.height / 2),
    //         );
    //       },
    //
    //
    //       child: Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           image: DecorationImage(
    //               image: AssetImage(categories[widget.index]['categoryImagesPath']),
    //               fit: BoxFit.cover),
    //         ),
    //         margin: EdgeInsets.symmetric(horizontal: 10),
    //         width: 150,
    //         height: 150,
    //       ),
    //     ),
    //     Positioned(
    //       bottom: 0,
    //       left: 10,
    //       right: 10,
    //       child: Container(
    //         padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    //         color: Theme.of(context).backgroundColor,
    //         child: Text(
    //           categories[widget.index]['categoryName'],
    //           style: TextStyle(
    //             fontWeight: FontWeight.w500,
    //             fontSize: 18,
    //             // ignore: deprecated_member_use
    //             color: Theme.of(context).textSelectionColor,
    //           ),
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
