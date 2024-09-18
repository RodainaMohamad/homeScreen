import 'package:flutter/material.dart';
import 'package:trial_hpg/data/model/response/CategoryDm.dart';
import 'package:trial_hpg/data/model/response/ProductDM.dart';
import 'package:trial_hpg/ui/tabs/homePage/widgets/categoryItem.dart';
import 'package:trial_hpg/ui/tabs/homePage/widgets/productItem.dart';

Widget buildCategories (List<categoryDM>list)=>
    GridView.builder(
      itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        return CategoryItem(list[index]);
      },
    );

Widget buildProducts (List<ProductDM>list)=>
    ListView.builder(
      itemCount: list.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        return Product(list[index]);
      },
    );