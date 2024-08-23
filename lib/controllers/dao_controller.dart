
import 'package:hyrule/data/dao/database.dart';
import 'package:hyrule/domain/models/business/dao_workflow.dart';
import 'package:hyrule/data/dao/entry_dao.dart';
import 'package:hyrule/domain/models/entry.dart';

class DaoContoller implements DaoWorkflow{
  Future<EntryDao> createDatabase()async{
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final EntryDao entryDao = database.entryDao;
    return entryDao;
  }

  @override
  Future<void> deleteEntry({required Entry entry}) async {
    final EntryDao entryDao = await createDatabase();
    entryDao.removeEntry(entry);
  }

  @override
  Future<List<Entry>> getSaveEntries() async {
    final EntryDao entryDao = await createDatabase();
    return entryDao.getAllEntries();
  }

  @override
  Future<void> saveEntry({required Entry entry}) async {
    final EntryDao entryDao = await createDatabase();
    entryDao.addEntry(entry);
  }
}