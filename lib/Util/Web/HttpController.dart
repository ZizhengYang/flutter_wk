import 'dart:convert';
import 'dart:io';

class HttpController {

  static dynamic get(String url, Function handleFunc) async {
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == 200) {
      var responseBody = await response.transform(utf8.decoder).join();
      return handleFunc(responseBody);
    }
    else {
      return null;
    }
  }

  static dynamic post(String url, Map<String, String> params, Function handleFunc) async {
    var httpClient = new HttpClient();
    var request = await httpClient.postUrl(Uri.parse(url));
    request.add(utf8.encode(json.encode(params)));
    var response = await request.close();
    if (response.statusCode == 200) {
      var responseBody = await response.transform(utf8.decoder).join();
      return handleFunc(responseBody);
    }
    else {
      return null;
    }
  }

//  static void fjdshfkd(String url) async {
//    var responseBody;
//    var httpClient = new HttpClient();
//    var request = await httpClient.getUrl(Uri.parse(url));
//
//    var response = await request.close();
//    //判断是否请求成功
//    if (response.statusCode == 200) {
//      //拿到请求的数据
//      responseBody = await response.transform(utf8.decoder).join();
//      //解析json，拿到对应的jsonArray数据
//      var convertDataToJson = jsonDecode(responseBody)["data"]["datas"];
//
//    } else {
//      print("error");
//    }
//  }

//  static void getdsds(String url, Function callback,
//      {Map<String, String> params, Function errorCallback}) async {
//    if (params != null && params.isNotEmpty) {
//      StringBuffer sb = new StringBuffer("?");
//      params.forEach((key, value) {
//        sb.write("$key" + "=" + "$value" + "&");
//      });
//      String paramStr = sb.toString();
//      paramStr = paramStr.substring(0, paramStr.length - 1);
//      url += paramStr;
//    }
//    try {
//      http.Response res = await http.get(url);
//      if (callback != null) {
//        callback(res.body);
//      }
//    } catch (exception) {
//      if (errorCallback != null) {
//        errorCallback(exception);
//      }
//    }
//  }

}