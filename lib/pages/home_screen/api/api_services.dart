import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/pages/home_screen/api/api_constant.dart';

import '../popular/models/video.dart';
class ApiServices{
static Future<MovieVedio?> getVedio()async{
try{
  final uri=Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.popularApi,
      {
        'api-key':ApiConstant.apiKey,
        'language':'en-US',
        'page': '1',
      }
  );
  final response=await http.get(uri);
  final json=jsonDecode(response.body);
  if(response.statusCode==200){
    return MovieVedio.fromJson(json);
  }else {
          // Throwing an exception for non-200 responses
          throw Exception(
              'Failed to load popular movies: ${response.statusCode}');

}
}catch(error){
 print("the error is $error");
}
}
}