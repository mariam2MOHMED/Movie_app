import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/pages/home_screen/api/api_constant.dart';


class ApiServices{
 static getPapular()async{

final dio=Dio();
final response=await dio
    .get("https://api.themoviedb.org/3/movie/popular?language=en-US&api_key=ffc1f879898e670e13d37297ed30bbbc");

  }
// static Future<MovieVedio?> getVedio()async{
// try{
//   final uri=Uri.https(
//       ApiConstant.baseUrl,
//       ApiConstant.popularApi,
//       {
//         'api-key':ApiConstant.apiKey,
//         'language':'en-US',
//         'page': '1',
//       }
//   );
//   final response=await http.get(uri);
//   final json=jsonDecode(response.body);
//   if(response.statusCode==200){
//     return MovieVedio.fromJson(json);
//   }else {
//           // Throwing an exception for non-200 responses
//           throw Exception(
//               'Something went Wrong!!: ${response.statusCode}');
//
// }
// }catch(error){
//  print("the error is $error");
// }
// }
}