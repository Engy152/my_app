import 'package:flutter/material.dart';
import 'package:my_app/models/product_model.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem({Key? key, required this.product, required this.index}) : super(key: key);
  final ProductModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:11,right: 25.0,bottom: 17),
      child: Container(
        width: 570,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Image.network(
              //'images/Rectangle 3.png',
             'https://ecommerce.6sigmacode.com/${product!.productDetail!.productDetailImage![0].image!}',
              width: 150,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: 150,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     product.productDetail!.productNameInEnglish!.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyle(color: Colors.black,fontSize: 17) ,),
                    SizedBox(height: 7,),
                    Text(
                      //'pppp',
                        product.productDetail!.descriptionInEnglish!.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:TextStyle(color: Colors.grey,fontSize: 15)),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text(
                        product.productDetail!.price.toString(),
                      ),
                      SizedBox(width: 23,),
                      MaterialButton(
                          color: Colors.blueGrey,
                          child:
                          Text('Buy',style: TextStyle(color: Colors.white,fontSize: 15),),
                          height: 40,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),),
                          onPressed: (){})
                    ],)
                  ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}
