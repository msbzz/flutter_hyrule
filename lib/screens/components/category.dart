import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hyrule/screens/results/results.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Category extends StatelessWidget {
  const Category({Key? key, required this.category}) : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(category: category)));
            },
            borderRadius: BorderRadius.circular(16.0),
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border:
                      Border.all(width: 2.0, color: const Color(0xFF0079CF)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 6.0,
                        color: const Color(0xFF0079CF).withOpacity(0.2),
                        blurStyle: BlurStyle.outer),
                  ]),
              child: Center(child: Image.asset('$imagePath$category.png')),
            ),
          ),
        ),
        Text(categoriesMap[category]!),
      ],
    );
  }
}
