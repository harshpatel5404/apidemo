import 'package:dio/dio.dart';

import 'category_response.dart';

const String baseURL = "https://kurminfotech.in/faculty/";

Future<Dio> getDio() async {
  var options = BaseOptions(
    baseUrl: baseURL + 'api/',
    validateStatus: (status) {
      return status! < 500;
    },
    responseType: ResponseType.json,
    followRedirects: false,
  );
  Dio dio = Dio(options);

  return dio;
}

Future<CategoryResponse> getCategories() async {
  Dio dio = await getDio();
  Response response = await dio.post("listCategories");
  try {
    final categoryResponse = CategoryResponse.fromJson(response.data);
    return categoryResponse;
  } catch (error) {
    var categoryResponse = CategoryResponse();
    return categoryResponse;
  }
}
