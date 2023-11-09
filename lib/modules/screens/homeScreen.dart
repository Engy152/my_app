import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/modules/widgets/HomePageItem.dart';
import 'package:my_app/shared/cubit/HomePageCubit/cubit.dart';
import 'package:my_app/shared/cubit/HomePageCubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageCubit.get(context).getAllProduct();
    return BlocConsumer<HomePageCubit,HomePageStates>(
      listener: ( context, HomePageStates state) {  },
      builder: (context, HomePageStates state)
      {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: state is HomePageLoadingStates? Center(child: CircularProgressIndicator()):
          Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category App',
                  style: TextStyle
                    (
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: 10,),
                Text('Trending Products',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    //physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index)
                    {
                        return HomePageItem(product: HomePageCubit.get(context).listProduct[index], index: index,);
                    },
                    itemCount: HomePageCubit.get(context).listProduct.length,

                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}