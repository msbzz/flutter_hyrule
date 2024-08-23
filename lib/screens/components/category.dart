import 'package:flutter/material.dart';
import 'package:hyrule/screens/results/results.dart';
import 'package:hyrule/utils/consts/categories.dart';
 
class Category extends StatelessWidget {
  const Category({Key? key, required this.category}) : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=> Results(category:category)));
          },
          child: Ink(
            child: Center(child: Image.asset('$imagePath$category.png')),
          ),
        ),
        Text(categoriesMap[category]!),
      ],
    );
  }
}
