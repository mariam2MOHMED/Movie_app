import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
final  int statusCode;
 final String statusMessage;
final bool sucess;

  ErrorMessageModel({required this.statusCode,
    required this.statusMessage,
    required this.sucess});
factory ErrorMessageModel.fromJson(Map<String,dynamic>json)=>
    ErrorMessageModel(
    statusCode: json["status_message"],
    statusMessage: json["status_code"],
        sucess: json["success"]);

  @override
  // TODO: implement props
  List<Object?> get props => [statusMessage,statusCode,sucess];

}