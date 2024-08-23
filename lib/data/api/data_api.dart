import 'package:dio/dio.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/utils/consts/api.dart';

class DataApi {
  final Dio dio = Dio();

  List<Entry> entries = [];

  Future<List<Entry>> getEntriesCategory({required String category}) async {
    // print('>> ${url + category} <<');
    final response = await dio.get(url + category);
    try {
      entries =
          List<Entry>.from(response.data['data'].map((e) => Entry.fromMap(e)));
    } catch (e) {
      print('Erro ao processar dados: $e');
    }
    return entries;
  }
}
