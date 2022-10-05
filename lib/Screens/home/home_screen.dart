import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:pharmacy_appnew_version/Widgets/section_title.dart';
import 'package:pharmacy_appnew_version/controller/test_firebase/firebase_controller.dart';
import 'package:pharmacy_appnew_version/controller/banner/get_banner.dart';
import 'package:pharmacy_appnew_version/model/category_model.dart';

import '../../Widgets/widgets.dart';
import '../../blocs/category/category_bloc.dart';
import '../../model/model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> docId = [];

  getAllProducts() async {
    await FirebaseFirestore.instance
        .collection('banner')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docId.add(element.reference.id);
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
    print(docId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarPage(title: 'Our Pharmacy'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionTitle(title: 'ផលិតផលកុំពុងពេញនិយម'),
            // អត់ Load bloc Product Card
            ProductCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBarPage(),
    );
  }
}
