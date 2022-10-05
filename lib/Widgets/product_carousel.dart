import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/controller/test_firebase/firebase_controller.dart';
import 'package:pharmacy_appnew_version/controller/product/get_data.dart';

import '../Screens/product/product_screen.dart';
import '../blocs/Cart/cart_bloc.dart';
import '../blocs/WishList/wishlist_bloc.dart';
import '../controller/product/get_image_firebase_controller.dart';
import '../model/model.dart';

class ProductCarousel extends StatefulWidget {
  // final List<Product> products;
  //final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

  const ProductCarousel({
    Key? key,
    //required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5.0,
    this.isWishList = false,
    // required this.products,
  }) : super(key: key);

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  List<String> docId = [];

  getAllProducts() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docId.add(element.reference.id);
            }));
  }

  var fireInit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fireInit = getAllProducts();
    print(docId);
  }

  @override
  Widget build(BuildContext context) {
    final double widthValue =
        MediaQuery.of(context).size.width / widget.widthFactor;
    return SizedBox(
        height: 200,
        child: FutureBuilder(
          future: fireInit,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Icon(
                  Icons.info,
                  size: 30,
                  color: Colors.red,
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              scrollDirection: Axis.horizontal,
              itemCount: docId.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductScreen(product: Product.products[index]),
                        ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: widthValue + 70,
                        height: widthValue + 80,
                        decoration: const BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                        margin: const EdgeInsets.all(10),
                        child: GetImagePage(documentId: docId[index]),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
