/*

import 'package:dio/dio.dart';
import 'package:online_shop/model/product.dart';

import 'response_model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  String baseurl = "https://dummyjson.com";
  String get _url => baseurl + "/product";


  Future<Product> fetchProductList() async {
    try {
      Response response = await _dio.get(_url);
      return Product.fromJson(response.data);
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        // DioErrorType.RESPONSE
        print("Dio error response: ${dioError.response}");
        return Product;
      } else {
        // DioErrorType.DEFAULT
        print("Dio error: ${dioError.message}");
        return Product.withError("Connection Issue: ${dioError.message}");
      }
    } catch (error, stacktrace) {
      // Other generic errors
      print("Exception occurred: $error stackTrace: $stacktrace");
      return Product.withError("Unknown Error: $error");
    }
  }
  Future<ResponseModel> postData(Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(_url, data: data);
      return ResponseModel.fromJson(response.data);
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        print("Dio error response: ${dioError.response}");
        return ResponseModel.withError("HTTP Error: ${dioError.message}");
      } else {
        print("Dio error: ${dioError.message}");
        return ResponseModel.withError("Connection Issue: ${dioError.message}");
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return ResponseModel.withError("Unknown Error: $error");
    }


  }

  Future<dynamic> updateData(int productId, Map<String, dynamic> data) async {
    final String url = '$_url/products/$productId';

    try {
      Response response = await _dio.put(url, data: data);
      return ResponseModel.fromJson(response.data);
    } on DioError catch (dioError) {
      _handleError(dioError);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return ResponseModel.withError("Unknown Error: $error");
    }
  }

  void _handleError(DioError dioError) {
    if (dioError.response != null) {
      print("Dio error response: ${dioError.response}");
      throw ResponseModel.withError("HTTP Error: ${dioError.message}");
    } else {
      print("Dio error: ${dioError.message}");
      throw ResponseModel.withError("Connection Issue: ${dioError.message}");
    }
  }

}*/
