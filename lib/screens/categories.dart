import 'package:flutter/material.dart';
import 'package:hyrule/utils/consts/categories.dart';
import 'package:hyrule/screens/components/category.dart';
class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Escolha uma categoria'),
        centerTitle: true,
      ),
      body:GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,crossAxisSpacing: 16,mainAxisSpacing: 16), 
        children: categoriesMap.keys.map((e)=> Category(category:e)).toList()   
        ),
    ));
  }
}
