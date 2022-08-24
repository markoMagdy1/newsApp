import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

import '../components.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TextEditingController searchName=TextEditingController();
        var search = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller:searchName ,
               onFieldSubmitted:(value){
                 AppCubit.get(context).getSearchNews(value:value);
               } ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(15)),
                  label: Text('Search'),
                  suffixIcon: Icon(Icons.search_outlined),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(child: buildArticle(search,isSearch: true))

          ]),
        );
      },

    );
  }
}
