import 'dart:convert';

import 'package:find_work_or_worker/core/service_locator.dart';

import '../../data/local_data_source.dart';

abstract class SaveRepository {
  Future<bool> saveId(int id);
  String? readId();
  Future<bool> removeId(int id);
}

class SaveRepositoryImpl implements SaveRepository {
  final LocalDataSource dataSource;
  const SaveRepositoryImpl({required this.dataSource});

  @override
  String? readId() {
    return dataSource.read(StorageKey.id);
  }

  @override
  Future<bool> removeId(int id) {
    return dataSource.remove(StorageKey.id);
  }

  @override
  Future<bool> saveId(int id) async {
    String? id = idRepository.readId();
    id = id;
    final json = jsonEncode(id);
    return await dataSource.store(StorageKey.id, json);
  }

}