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
        width: 530,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Image.network(
             'https://ecommerce.6sigmacode.com/${product!.productDetail!.productDetailImage![0].image!}',
              width: 150,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   product.productDetail!.productNameInEnglish!.substring(0,17),
                  //  maxLines: 2,
                    style:TextStyle(color: Colors.black,fontSize: 17) ,),
                  SizedBox(height: 7,),
                  Text(
                      product.productDetail!.descriptionInEnglish!.toString(),
                      style:TextStyle(color: Colors.grey,fontSize: 15)),
                  SizedBox(height: 10,),
                  Row(children: [
                    Text(
                      product.productDetail!.price.toString(),
                    ),
                    SizedBox(width: 50,),
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
            )
          ],
        ),
      ),
    );
  }
}
