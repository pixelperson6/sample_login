import 'dart:io';


class HttpConfig {
  static String apiVersion = '1';
  static String urlHeader = 'http://api.sample.com';
  static String baseUrl = '$urlHeader/api/v$apiVersion'.toString();


  //list of api

  
}

class Header {
  static Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json;charset=utf-8',
  };
}
