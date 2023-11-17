


import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/models/product_model.dart';
import 'package:my_app/network/http.dart';
import 'package:my_app/shared/cubit/HomePageCubit/states.dart';

class HomePageCubit extends Cubit<HomePageStates>
{
  HomePageCubit():super(HomePageInitialStates());
  static HomePageCubit get(context) => BlocProvider.of(context);
  List<ProductModel>listProduct=[];

 void getAllProduct() async
  {
    emit(HomePageLoadingStates());
    listProduct = [];
    print('999999999999999999999'); 
      Api().get(url: 'http://85.93.89.54:8020/Home/GetWishlistItems',
          headers:
      {
        'Authorization' : 'Bearer ZQNblDEYZvb_7QmYoSz2y6_-G6OWlkF4KJLXkz_Sjl9CBrTyBKwwscS278-KnsIrwd6fpzDcvaSkeeE2Apz7cz01KUooNn9ugfnUK1-GEcUoykkxd-71LuQKE8Uej_kL6jGp41RwULNKLK-vlL1GvbZ2UAONLym06sc7W8vS3ysmioSY2olv4mKajKVrg6D0Q2krQSCL9g6W6JYsHxDdpOYA7A-iuVJSQ-eY_bZfvOHRZ242gnyFTGSpD0MOQrCXj3w72uBhyuZZghFdMUMdK9YCgVVk86F1usu9YibOIPAXPP5aqvzbeaXSb_iJc65puxbmM79guFNu7JzQ3mAYhMNgSqWrlBCGrSEApOAK-NN6vShfvGGKcMOvAp5MQFb8p63YyajIN8GEIyVGJ43ls8ruC6mBxlTWidzue2AejioVH8hrZENADbLb-x_pDsVcLnEmRmHjJwHf6ExCg8RMZ66qyeWVp24-ISaq6zEorh6eEzfwFGpFMLPcux0-DeLBZ1CycklZg2qFADM2FyDimQ',
      }
      ).then((value)
      {
        final data = jsonDecode(value.body);
        print(data);
        if(value.statusCode == 200)
        {
          for(int i = 0 ; i< data.length;i++)
            {
              print('kkkkkkkkkkkkkkk');
             listProduct.add(ProductModel.fromJson(data[i]));
             print('77777777777777');

            }
          print(listProduct.length);
          print('0000000000');
          print(listProduct[7]);

          emit(HomePageScseesStates());

        }else
        {
          print('errrrrrrrrror');
        }

      }).catchError((e){
        print(e.toString());
        emit(HomePageErrorStates());
      });
    }
  }