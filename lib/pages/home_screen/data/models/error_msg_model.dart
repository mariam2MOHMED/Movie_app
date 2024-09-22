import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final String statusCode;
  final String statusMessage;
  final bool sucess;
 const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.sucess,

});
  factory ErrorMessageModel.fromJson(Map<String,dynamic>json){
    return ErrorMessageModel(statusCode: json['status_code'],
        statusMessage: json['status_message'],
        sucess: json['success']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    statusCode,statusMessage,sucess
  ];
}