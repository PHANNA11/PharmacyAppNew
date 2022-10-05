import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_appnew_version/Screens/home/home_screen.dart';
import 'package:pharmacy_appnew_version/Screens/screens.dart';
import 'package:pharmacy_appnew_version/auth/register_screen.dart';
import 'package:pharmacy_appnew_version/blocs/Cart/cart_bloc.dart';
import 'package:pharmacy_appnew_version/blocs/WishList/wishlist_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pharmacy_appnew_version/blocs/category/category_bloc.dart';
import 'package:pharmacy_appnew_version/controller/test_firebase/list_view.dart';
import 'package:pharmacy_appnew_version/repositories/category/category_repository.dart';
import 'package:pharmacy_appnew_version/sample_bloc_observer.dart';
import 'Config/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: HomeScreen(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => WishlistBloc()..add(LoadWishList())),
//         BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
//         BlocProvider(
//             create: (_) => CategoryBloc(
//                   categoryRepository: CategoryRepository(),
//                 )..add(LoadCategories()))
//       ],
//       child: MaterialApp(
//         //title: 'Our Pharmacy',
//         debugShowCheckedModeBanner: false,
//         onGenerateRoute: AppRouter.onGenerateRoute,
//         initialRoute: SplashScreen.routeName,
//         //home: RegisterScreen(),
//       ),
//     );
//   }
// }
