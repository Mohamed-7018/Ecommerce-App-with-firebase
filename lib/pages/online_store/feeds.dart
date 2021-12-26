import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samir_online_store/models/product_model.dart';
import 'package:samir_online_store/providers/products.dart';
import 'package:samir_online_store/widgets/online_store_widgets/feeds_products.dart';

class Feeds extends StatefulWidget {
//  static const routeName = '/Feeds';
  final popular;

  const Feeds({Key key, this.popular}) : super(key: key);

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  Future<void> _getProductsOnRefresh() async {
    await Provider.of<Products>(context, listen: false).FetchProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);

    List<Product> productsList = productsProvider.products;
    if (widget.popular == "popular") {
      productsList = productsProvider.popularProducts;
    }
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.indigo[800],
        //   elevation: 0,
        //   centerTitle: true,
        //   title: Text(
        //     "Feeds",
        //     style: TextStyle(
        //       fontSize: 16,
        //       fontWeight: FontWeight.normal,
        //     ),
        //   ),
        //
        // ),
        body: RefreshIndicator(
          onRefresh: _getProductsOnRefresh,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 420,
            crossAxisSpacing: 2,
            mainAxisSpacing: 8,
            children: List.generate(productsList.length, (index) {
              return ChangeNotifierProvider.value(
                  value: productsList[index], child: FeedProducts());
            }),
          ),
        )
//          StaggeredGridView.countBuilder(
////        padding: 10,
//        crossAxisCount: 6,
//        itemCount: 8,
//        itemBuilder: (BuildContext context, int index) => FeedProducts(),
//        staggeredTileBuilder: (int index) =>
//            new StaggeredTile.count(3, index.isEven ? 4 : 5),
//        mainAxisSpacing: 8.0,
//        crossAxisSpacing: 6.0,
//      ),
        );
  }
}
