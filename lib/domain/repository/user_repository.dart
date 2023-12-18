import 'dart:convert';

import 'package:find_work_or_worker/core/service_locator.dart';
import 'package:find_work_or_worker/data/local_data_source.dart';

abstract class UserRepository {
  Future<bool> saveUserLastName(String lastName);
  Future<bool> saveUserEmail(String email);
  Future<bool> saveUserPhone(String phone);
  String? readLastName();
  String? readEmail();
  String? readPhone();
  Future<bool> removeLastName();
  Future<bool> removeEmail();
  Future<bool> removePhone();
}

class UserRepositoryImpl implements UserRepository {
  final LocalDataSource dataSource;
  const UserRepositoryImpl({required this.dataSource});

  @override
  String? readEmail() {
    return dataSource.read(StorageKey.email);
  }

  @override
  String? readLastName() {
    return dataSource.read(StorageKey.lastName);
  }

  @override
  Future<bool> removeLastName() {
    return dataSource.remove(StorageKey.lastName);
  }

  @override
  Future<bool> removeEmail() {
    return dataSource.remove(StorageKey.email);
  }

  @override
  Future<bool> saveUserEmail(String email) async {
    String? userEmail = userRepository.readEmail();
    userEmail = email;
    final json = jsonEncode(userEmail);
    return await dataSource.store(StorageKey.email, json);
  }

  @override
  Future<bool> saveUserLastName(String lastName) async {
    String? userLastName = userRepository.readLastName();
    userLastName = lastName;
    final json = jsonEncode(userLastName);
    return await dataSource.store(StorageKey.lastName, json);
  }

  @override
  String? readPhone() {
    return dataSource.read(StorageKey.phone);
  }

  @override
  Future<bool> removePhone() {
    return dataSource.remove(StorageKey.phone);
  }

  @override
  Future<bool> saveUserPhone(String phone) async {
    String? phone = userRepository.readLastName();
    phone = phone;
    final json = jsonEncode(phone);
    return await dataSource.store(StorageKey.phone, json);
  }
}