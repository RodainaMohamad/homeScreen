import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_hpg/data/model/response/categoryDm.dart';
import 'package:trial_hpg/domain/getIt.dart';
import 'package:trial_hpg/ui/tabs/homePage/HomeViewModel.dart';
import 'package:trial_hpg/ui/tabs/homePage/buildCategories.dart';
import 'package:trial_hpg/ui/tabs/homePage/product_view_model.dart';
import 'package:trial_hpg/ui/tabs/homePage/widgets/ErrorView.dart';
import 'package:trial_hpg/ui/tabs/homePage/widgets/HomeAppliances.dart';
import 'package:trial_hpg/ui/tabs/homePage/widgets/Loading.dart';
import 'package:trial_hpg/ui/tabs/homePage/widgets/ads.dart';
import 'package:trial_hpg/ui/tabs/homePage/widgets/sections.dart';
import 'package:trial_hpg/ui/utilities/constants/BaseStates.dart';

import '../../../data/model/response/ProductDM.dart';
import '../../utilities/constants/product_state.dart';

class Home extends StatefulWidget {
  static const String routeName = "Home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeTabState();
}

class _HomeTabState extends State<Home> {
  late HomeViewModel _homeViewModel;
  late ProductViewModel _productViewModel;
  int _adsIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    'assets/CarouselSlider1.png',
    'assets/CarouselSlider2.png',
    'assets/CarouselSlider3.png',
  ];

  @override
  void initState() {
    super.initState();
    _homeViewModel = locator<HomeViewModel>();
    _productViewModel = locator<ProductViewModel>();
    _productViewModel.LoadProducts() ;
    _homeViewModel.LoadCategories();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _adsIndex = (_adsIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Image.asset('assets/route.png'),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/search.png'),
                        ),
                        hintText: 'What do you search for?',
                        hintStyle: const TextStyle(color: Colors.blue),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20.0),
                            right: Radius.circular(20.0),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20.0),
                            right: Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {}, // Navigation to cart screen //
                    icon: Image.asset('assets/cart.png'),
                  )
                ],
              ),
              Ads(
                adsImages: adsImages,
                currentIndex: _adsIndex,
                timer: _timer,
              ),
              Section(
                function: () {}, //Navigation to categories screen//
                secName: 'Categories',
              ),
              BlocConsumer(
                bloc: locator<HomeViewModel>(),
                builder: (context, state) {
                  if (state is BaseLoadingState) {
                    return LoadingWidget(); // Show loading indicator
                  } if (state is BaseSuccessState<List<categoryDM>>) {
                    return buildCategories(
                        state.data); // Display categories when loaded
                  }  if (state is BaseErrorState) {
                    return ErrorView(
                        message: state.errorMessage); // Show error message
                  } else {
                    return LoadingWidget(); // Default fallback to loading
                  }
                }, listener: (BuildContext context, Object? state) {

              },
              ),
              const SizedBox(height: 12),
              HomeAppliances(),
              BlocBuilder(
                bloc: locator<ProductViewModel>(),
                builder: (context, state) {
                  print('State: $state');
                  if (state is ProductSuccessState<List<ProductDM>>) {
                    return buildProducts(state.data);
                  }  if (state is ProductErrorState) {
                    return ErrorView(message: state.errorMessage);
                  }  if (state is ProductLoadingState) {
                    return LoadingWidget();
                  } else {
                    return Container(color: Colors.red,);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
// SizedBox(height: 12.h),
// CustomSectionBar(sectionNname: 'Brands', function: () {}),
// SizedBox(
//   height: 270.h,
//   child: GridView.builder(
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (context, index) {
//       return const CustomBrandWidget();
//     },
//     itemCount: 20,
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//     ),
//   ),
// ),
// CustomSectionBar(
//   sectionNname: 'Most Selling Products',
//   function: () {},
// ),
// SizedBox(
//   child: SizedBox(
//     height: 360.h,
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return const ProductCard(
//           title: "Nike Air Jordon",
//           description:
//               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
//           rating: 4.5,
//           price: 1100,
//           priceBeforeDiscound: 1500,
//           image: ImageAssets.categoryHomeImage,
//         );
//       },
//       itemCount: 20,
//     ),
//   ),
// ),
