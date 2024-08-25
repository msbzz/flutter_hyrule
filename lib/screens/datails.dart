import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.entry}) : super(key: key);
  final Entry entry;
  final DaoController daoConroller = DaoController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.bookmark),
          onPressed: () => {
                daoConroller.saveEntry(entry: entry),
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("item adicionado"),duration: Duration(seconds: 1))),
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.pop(context);
                })
              }),
      body: Column(children: <Widget>[
        Text(entry.name),
        Wrap(
            children: entry
                .commonLocationConverter()
                .map((e) => Chip(label: Text(e)))
                .toList()),
        Image.network(entry.image),
        Text(entry.description),
      ]),
    ));
  }
}
