import 'package:movie_app/pages/home_screen/data/models/error_msg_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;
const  ServerException({
 required
 this.errorMessageModel});
}
class LocalDataBaseException implements Exception{
  final String errorMessage;
  const  LocalDataBaseException({
    required
    this.errorMessage});
}