// ignore_for_file: unused_catch_clause, deprecated_member_use

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:pusher_full_chat_example/core/end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          baseUrl: ApiEndPoints.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            "Accept": "application/json",
            'authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjVlNDI0M2JlYTRjZTBjNmI2Mzk3MTJmMDNkMTg4MzUzNzY4NWQxNTEzNWQwZTA4MTQ5NjhlY2MzNzMxY2JhOWJjOGY1ZWMxZDMxMzM0ZDUiLCJpYXQiOjE3MjkzMjExMzguNjIzNTY5OTY1MzYyNTQ4ODI4MTI1LCJuYmYiOjE3MjkzMjExMzguNjIzNTc0MDE4NDc4MzkzNTU0Njg3NSwiZXhwIjoxNzYwODU3MTM4LjU5MDQyMzEwNzE0NzIxNjc5Njg3NSwic3ViIjoiMTMiLCJzY29wZXMiOltdfQ.jcCtYqhhmG6cEpbX4XS-flirjpPm5B31zFt143q_hpj0Gk-uFykCWuFgqwG8zclDjc5H5Q0NCee5yfM-OflHvL8FHdFuAN82Zz1SJBfSxJlMHvULuplThkX16ZmRzbQiLnEohHmMIBqbAJOQVZ2UL5bty_C3tIBCY84I87G6kBj4BLoQaZXsAN6ijcQez_PsoIzSQjrdFXhP8Krfb_0JgJKrvDNtGtOuOPjcZAjkZ6TnNtlFTIqOsFtRQxEJUfcBH2pAp_nnW2_VFlCNZ2zL5oVoVgSjaFMG_mw-3hxN_3_osEzN5RkdxSYf3N-dq0gUt44KqA0s_MOtfVmuziae9UU0dDGwUKCe0MyLLN9BdfufZa7Ih3NuwAM6PttdIUOpOAE1oayiVLUvP0ANc82nJ73U05-XXauj-xqUzft8Ofr9Ms-0hnHMb9wlpWZzaQ5WZL6H51jbzIHWCXMbrhouLE8z_SZigHy9PpBCl7Z7S8YrgvhnCUH20Ca2ZjKvxJD5WI9pcIaNrNhPyHyDmWgOb8g8VGt9fpbEA-bjIe62D0Pn5q6K8VrSNFZnuoEo702kiR4P3-vIzGAg0v0HyFBlu7CmDTN1Y-JA8tDmpIONcy9sGdhT12-jlqYquHZHa3YEwZWwzk-apAl328aBQfZoXcueFGl3gd2NOABG0dAzCIA'
          }),
    );

    dio!.interceptors.add(PrettyDioLogger());

    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjVlNDI0M2JlYTRjZTBjNmI2Mzk3MTJmMDNkMTg4MzUzNzY4NWQxNTEzNWQwZTA4MTQ5NjhlY2MzNzMxY2JhOWJjOGY1ZWMxZDMxMzM0ZDUiLCJpYXQiOjE3MjkzMjExMzguNjIzNTY5OTY1MzYyNTQ4ODI4MTI1LCJuYmYiOjE3MjkzMjExMzguNjIzNTc0MDE4NDc4MzkzNTU0Njg3NSwiZXhwIjoxNzYwODU3MTM4LjU5MDQyMzEwNzE0NzIxNjc5Njg3NSwic3ViIjoiMTMiLCJzY29wZXMiOltdfQ.jcCtYqhhmG6cEpbX4XS-flirjpPm5B31zFt143q_hpj0Gk-uFykCWuFgqwG8zclDjc5H5Q0NCee5yfM-OflHvL8FHdFuAN82Zz1SJBfSxJlMHvULuplThkX16ZmRzbQiLnEohHmMIBqbAJOQVZ2UL5bty_C3tIBCY84I87G6kBj4BLoQaZXsAN6ijcQez_PsoIzSQjrdFXhP8Krfb_0JgJKrvDNtGtOuOPjcZAjkZ6TnNtlFTIqOsFtRQxEJUfcBH2pAp_nnW2_VFlCNZ2zL5oVoVgSjaFMG_mw-3hxN_3_osEzN5RkdxSYf3N-dq0gUt44KqA0s_MOtfVmuziae9UU0dDGwUKCe0MyLLN9BdfufZa7Ih3NuwAM6PttdIUOpOAE1oayiVLUvP0ANc82nJ73U05-XXauj-xqUzft8Ofr9Ms-0hnHMb9wlpWZzaQ5WZL6H51jbzIHWCXMbrhouLE8z_SZigHy9PpBCl7Z7S8YrgvhnCUH20Ca2ZjKvxJD5WI9pcIaNrNhPyHyDmWgOb8g8VGt9fpbEA-bjIe62D0Pn5q6K8VrSNFZnuoEo702kiR4P3-vIzGAg0v0HyFBlu7CmDTN1Y-JA8tDmpIONcy9sGdhT12-jlqYquHZHa3YEwZWwzk-apAl328aBQfZoXcueFGl3gd2NOABG0dAzCIA';
          return handler.next(options);
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'accept': 'application/json',
      'contentType': 'application/json',
      'authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjVlNDI0M2JlYTRjZTBjNmI2Mzk3MTJmMDNkMTg4MzUzNzY4NWQxNTEzNWQwZTA4MTQ5NjhlY2MzNzMxY2JhOWJjOGY1ZWMxZDMxMzM0ZDUiLCJpYXQiOjE3MjkzMjExMzguNjIzNTY5OTY1MzYyNTQ4ODI4MTI1LCJuYmYiOjE3MjkzMjExMzguNjIzNTc0MDE4NDc4MzkzNTU0Njg3NSwiZXhwIjoxNzYwODU3MTM4LjU5MDQyMzEwNzE0NzIxNjc5Njg3NSwic3ViIjoiMTMiLCJzY29wZXMiOltdfQ.jcCtYqhhmG6cEpbX4XS-flirjpPm5B31zFt143q_hpj0Gk-uFykCWuFgqwG8zclDjc5H5Q0NCee5yfM-OflHvL8FHdFuAN82Zz1SJBfSxJlMHvULuplThkX16ZmRzbQiLnEohHmMIBqbAJOQVZ2UL5bty_C3tIBCY84I87G6kBj4BLoQaZXsAN6ijcQez_PsoIzSQjrdFXhP8Krfb_0JgJKrvDNtGtOuOPjcZAjkZ6TnNtlFTIqOsFtRQxEJUfcBH2pAp_nnW2_VFlCNZ2zL5oVoVgSjaFMG_mw-3hxN_3_osEzN5RkdxSYf3N-dq0gUt44KqA0s_MOtfVmuziae9UU0dDGwUKCe0MyLLN9BdfufZa7Ih3NuwAM6PttdIUOpOAE1oayiVLUvP0ANc82nJ73U05-XXauj-xqUzft8Ofr9Ms-0hnHMb9wlpWZzaQ5WZL6H51jbzIHWCXMbrhouLE8z_SZigHy9PpBCl7Z7S8YrgvhnCUH20Ca2ZjKvxJD5WI9pcIaNrNhPyHyDmWgOb8g8VGt9fpbEA-bjIe62D0Pn5q6K8VrSNFZnuoEo702kiR4P3-vIzGAg0v0HyFBlu7CmDTN1Y-JA8tDmpIONcy9sGdhT12-jlqYquHZHa3YEwZWwzk-apAl328aBQfZoXcueFGl3gd2NOABG0dAzCIA'
    };

    var res = await dio!.get(url, queryParameters: query);
    log("headers for this request :  $url ${dio!.options.headers}");
    log("response for this request :  $url ${res.data}");

    return res;
  }

  static deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? lang,
    String? token,
  }) async {
    try {
      dio!.options.headers = {
        'Authorization': token ?? '',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      log("deleting");
      log(url.toString());
      log(data.toString());

      var res = await dio!.delete(url, queryParameters: query, data: data);
      log("body: $data");
      log("response of the delete: ${res.data}");

      return res;
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<Response> postData(
      {required String url,
      dynamic data,
      String? lang,
      String? token,
      Map<String, dynamic>? query,
      bool withFiles = false}) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': withFiles ? "multipart/form-data" : "application/json",
      'authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMjVlNDI0M2JlYTRjZTBjNmI2Mzk3MTJmMDNkMTg4MzUzNzY4NWQxNTEzNWQwZTA4MTQ5NjhlY2MzNzMxY2JhOWJjOGY1ZWMxZDMxMzM0ZDUiLCJpYXQiOjE3MjkzMjExMzguNjIzNTY5OTY1MzYyNTQ4ODI4MTI1LCJuYmYiOjE3MjkzMjExMzguNjIzNTc0MDE4NDc4MzkzNTU0Njg3NSwiZXhwIjoxNzYwODU3MTM4LjU5MDQyMzEwNzE0NzIxNjc5Njg3NSwic3ViIjoiMTMiLCJzY29wZXMiOltdfQ.jcCtYqhhmG6cEpbX4XS-flirjpPm5B31zFt143q_hpj0Gk-uFykCWuFgqwG8zclDjc5H5Q0NCee5yfM-OflHvL8FHdFuAN82Zz1SJBfSxJlMHvULuplThkX16ZmRzbQiLnEohHmMIBqbAJOQVZ2UL5bty_C3tIBCY84I87G6kBj4BLoQaZXsAN6ijcQez_PsoIzSQjrdFXhP8Krfb_0JgJKrvDNtGtOuOPjcZAjkZ6TnNtlFTIqOsFtRQxEJUfcBH2pAp_nnW2_VFlCNZ2zL5oVoVgSjaFMG_mw-3hxN_3_osEzN5RkdxSYf3N-dq0gUt44KqA0s_MOtfVmuziae9UU0dDGwUKCe0MyLLN9BdfufZa7Ih3NuwAM6PttdIUOpOAE1oayiVLUvP0ANc82nJ73U05-XXauj-xqUzft8Ofr9Ms-0hnHMb9wlpWZzaQ5WZL6H51jbzIHWCXMbrhouLE8z_SZigHy9PpBCl7Z7S8YrgvhnCUH20Ca2ZjKvxJD5WI9pcIaNrNhPyHyDmWgOb8g8VGt9fpbEA-bjIe62D0Pn5q6K8VrSNFZnuoEo702kiR4P3-vIzGAg0v0HyFBlu7CmDTN1Y-JA8tDmpIONcy9sGdhT12-jlqYquHZHa3YEwZWwzk-apAl328aBQfZoXcueFGl3gd2NOABG0dAzCIA'
    };
    log("headers for this request : ${dio!.options.headers}");

    try {
      var res = await dio!.post(
        url,
        data: data,
        queryParameters: query,
      );

      log("i am in the post method :$res");

      return res;
    } on DioError catch (e) {
      log(e.response.toString());
      rethrow;
    }
  }

  static Future<Response> putData({
    required String url,
    dynamic data,
    String? lang,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    var res = await dio!.put(
      url,
      data: data,
      queryParameters: query,
    );

    return res;
  }
}
