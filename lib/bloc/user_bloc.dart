import 'dart:async';

import 'package:dio/dio.dart';

import '../Api_Services/api_service.dart';
import '../model/user.dart';



enum UserState { Loading, Loaded, Error }

class UserBloc {
  final ApiService _apiService = ApiService(Dio());
  final _userController = StreamController<List<User>>();
  final _stateController = StreamController<UserState>();

  Stream<List<User>> get users => _userController.stream;
  Stream<UserState> get state => _stateController.stream;

  void fetchUsers() async {
    _stateController.add(UserState.Loading);
    try {
      final users = await _apiService.getUsers();
      _userController.add(users);
      _stateController.add(UserState.Loaded);
    } catch (e) {
      _stateController.add(UserState.Error);
    }
  }

  void dispose() {
    _userController.close();
    _stateController.close();
  }
}
