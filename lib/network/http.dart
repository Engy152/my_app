// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// //import 'package:http/http.dart';
//
// class Athentivation {
//   // getRequest({
//   //   required  String url,
//   //   Map<String, dynamic>? query,
//   // }) async {
//   //   final uri = Uri.parse(url);
//   //   final headers = ApiAuth.instance.headers;
//   //   return await checkResponse(() => get(uri,headers: headers,));
//   // }
//   // getRequestQuery({
//   //   required String url,
//   //   Map<String, dynamic>? query,
//   // }) async {
//   //
//   //   String queryString = Uri(queryParameters: query).query;
//   //   var requestUrl = Uri.parse('$url?$queryString');
//   //   final headers = ApiAuth.instance.headers;
//   //   return await checkResponse(() => get(requestUrl,headers: headers,));
//   // }
//   static Future<http.Response>postRequest({required String url,required Map data}) async {
//     final uri = Uri.parse(url);
//     final headers = ApiAuth.instance.headers;
//     final body = await compute(encodeJson, data);
//     return await  http.post (uri, headers: headers, body: body);
//   }
//   // Future<Map> checkResponse(Future<Response> Function() apiCall) async {
//   //   try {
//   //     final response = await apiCall();
//   //     print(response.statusCode);
//   //
//   //     if (response.statusCode == 200) {
//   //       print("Response: ${response.body}");
//   //       final decodedBody = await compute(decodeJson, response.body);
//   //       if (decodedBody['isError'] == true) {
//   //         throw decodedBody['message'];
//   //       } else {
//   //         return decodedBody;
//   //       }
//   //     }
//   //     else
//   //     {
//   //       throw 'تعذر الإتصال';
//   //     }
//   //   }
//   //   on SocketException catch (e)
//   //   {
//   //     print(e);
//   //     throw 'تحقق من اتصالك بالانترنت';
//   //   }
//   //   on HttpException catch (e)
//   //   {
//   //     print(e);
//   //     throw 'تعذر الاتصال بالخادم';
//   //   }
//   //   on FormatException catch (e) {
//   //     print(e);
//   //     throw 'Bad response';
//   //   }
//   //   catch (e) {
//   //     print(e);
//   //     rethrow;
//   //   }
//   // }
// }
// class ApiAuth {
//   static final _instance = ApiAuth._();
//   static final instance = _instance;
//
//   ApiAuth._();
//   final token = '';
//   Map<String, String> get headers {
//     return {
//       'Content-Type': 'application/x-www-form-urlencoded',
//
//     };
//   }
// }
//
// decodeJson(String body) => json.decode(body);
// String encodeJson(body) => json.encode(body);

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart ' as http;

class Api{
  Future<http.Response> get({required String url,
    required Map<String,String> headers
  }) async
  {

    return await http.get(Uri.parse(url),
       headers: headers
    );

  }

  Future<http.Response> post({required String url, @required dynamic body,required Map<String,String> header}) async
  {

    return await http.post(Uri.parse(url), body: body,headers: header);

  }



}