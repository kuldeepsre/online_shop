
import 'package:online_shop/Api_Services/response_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<ResponseModel> fetchProductList() {
    return _provider.fetchProductList();
  }
}

class NetworkError extends Error {}