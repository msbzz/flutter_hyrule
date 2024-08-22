import 'package:floor/floor.dart';
import 'package:hyrule/domain/models/entry.dart';

@dao
abstract class EntrytDao {
  @Query('SELECT * FROM Entry')
  Future<List<Entry>> getAllEntries();
 
  @Insert(onConflict: OnConflictStrategy.replace) 
  Future<void> addEntry(Entry Entry);

  @delete
  Future<void> removeEntry(Entry entry);


}