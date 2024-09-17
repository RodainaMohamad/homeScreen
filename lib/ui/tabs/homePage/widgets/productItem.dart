import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trial_hpg/data/model/response/ProductDM.dart';
import 'package:trial_hpg/ui/tabs/homePage/widgets/Loading.dart';

class Product extends StatefulWidget {
  final ProductDM productDM;
  const Product(this.productDM, {super.key});

  @override
  State<Product> createState() => ProductState();
}

class ProductState extends State<Product> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(6),
        width: MediaQuery.of(context).size.width * .4,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color:Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.productDM.imageCover ?? "",
                  placeholder: (_, __) => LoadingWidget(),
                  errorWidget: (_, __, ___) => Icon(Icons.error),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * .15,
                ),
                IconButton(
                  onPressed: () {}, // to be added in favourite screen //
                  icon: Image.asset('assets/favorites.png'),
                ),
              ],
            ),
            Spacer(),
            Text(
              widget.productDM.title ?? "",
              textAlign: TextAlign.start,
              maxLines: 2,
              style: TextStyle(height: 1),
            ),
            Spacer(),
            Row(
              children: [
                Text("Review(${widget.productDM.ratingsAverage})"),
                Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                ),
              ],
            ),
            Row(
              children: [
                Text("EGP ${widget.productDM.price}"),
                Spacer(),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}