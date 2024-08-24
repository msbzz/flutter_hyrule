import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/screens/datails.dart';

class EntryCard extends StatelessWidget {
  EntryCard({Key? key, required this.entry,required this.isSaved}) : super(key: key);
  final Entry entry;
  final bool isSaved;

  final DaoController _daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        direction: isSaved ? DismissDirection.endToStart:DismissDirection.none,
        key:ValueKey<int> (entry.id),
        onDismissed: (direction) { 
           _daoController.deleteEntry(entry: entry);
        },
        child: Column(children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(entry:entry)));
            },
            child: Ink(
              child: Row(children: <Widget>[
                Image.network(entry.image),
                Column(children: <Widget>[Text(entry.name), Text(entry.description)]),
              ]),
            ),
          ),
          Wrap(
            children: entry
                .commonLocationConverter()
                .map(
                  (e) => Chip(
                    label: Text(e),
                  ),
                )
                .toList(),
          )
        ]),
      ),
    );
  }
}
