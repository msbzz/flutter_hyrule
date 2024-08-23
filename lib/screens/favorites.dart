import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/screens/components/entry_card.dart';


class Favorites extends StatelessWidget {
  Favorites({Key? key}) : super(key: key);
   
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Itens salvos'),
          ),
          body: FutureBuilder(
            future: daoController.getSaveEntries(),
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
