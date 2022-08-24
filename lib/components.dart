
import 'package:flutter/material.dart';

Widget buildItem(business,context)=>Container(
  height: 120,
  child: Row(
    children: [
      Container(
        height: 120,
        width: 120,
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image:NetworkImage(
                '${business['urlToImage']}'),
              fit: BoxFit.cover ,
            )
        ),
      ),
      SizedBox(width: 7,),
      Expanded(
        child: Column(
          children: [
            Expanded(
              child: Text(
                '${business['description']}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,


              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                '${business['publishedAt']}',
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          ],
        ),
      ),
    ],
  ),
);

Widget separatorBuilder()=> Padding(
  padding: const EdgeInsetsDirectional.only(start: 5,bottom: 5,top: 5),
  child: Container(
    height: 1,
    width: double.infinity,
    color: Colors.grey,
  ),
);

Widget  buildArticle(list,{bool isSearch=false})=>list.length>0 ? Padding(
  padding: const EdgeInsets.all(10.0),
  child: ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) =>buildItem (list[index],context) ,
      separatorBuilder:(context, index) =>  separatorBuilder(),
      itemCount: list.length
  ),
) : Center(child: CircularProgressIndicator());

ThemeMode currentThem=ThemeMode.dark;