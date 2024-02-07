
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chat/utils/date_util.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message_model.g.dart';

@JsonSerializable()
@TimestampConverter()
class MessageModel {

  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;

  // @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final Timestamp timestamp;

  MessageModel({
      required this.senderID,
      required this.senderEmail,
      required this.receiverID,
      required this.message,
      required this.timestamp,
      });

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  // static Timestamp _timestampFromJson(dynamic json) => json as Timestamp;
  // static dynamic _timestampToJson(Timestamp timestamp) => timestamp;

}