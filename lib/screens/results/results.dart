import 'package:flutter/material.dart';
import 'package:hyrule/controllers/api_controller.dart';
import 'package:hyrule/screens/components/entry_card.dart';
import 'package:hyrule/utils/consts/categories.dart';

class Results extends StatelessWidget {
  Results({Key? key, required this.category}) : super(key: key);
  final String category;
  final ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(categoriesMap[category]!),
          ),
          body: FutureBuilder(
            future: apiController.getEntriesCategory(category: category),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  print('ConnectionState.active');
                  break;
                case ConnectionState.none:
                  print('ConnectionState.none');
                  break;
                case ConnectionState.done:
                  print('ConnectionState.done');
                  if (snapshot.hasData) {
                    print('done ==>> snapshot.hasData');
                    return ListView.builder(
                      itemBuilder: (context, index) =>
                          EntryCard(entry: snapshot.data![index]),
                    );
                  }
                  break;
                case ConnectionState.waiting:
                   return const Center(child:CircularProgressIndicator(),);  
                default:
              }
              return Container();
            },
          )),
    );
  }
}
