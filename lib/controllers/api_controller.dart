import 'package:hyrule/data/api/data_api.dart';
import 'package:hyrule/domain/models/business/api_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

class ApiController implements ApiWorkflow{
  final DataApi dataApi = DataApi();

  @override
  Future<List<Entry>> getEntriesCategory({required String category}) {
    return dataApi.getEntriesCategory(category: category);
  }

}