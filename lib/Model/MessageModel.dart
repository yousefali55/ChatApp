import 'package:chatapp/widgets/Constants.dart';

class MessageModel{
  final String message;
  MessageModel(this.message);
  factory MessageModel.fromjson(jsonData){
    return MessageModel(jsonData[Kmessage]);
  }
}