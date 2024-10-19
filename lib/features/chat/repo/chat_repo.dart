import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pusher_full_chat_example/core/dio_helper.dart';
import 'package:pusher_full_chat_example/core/end_points.dart';
import 'package:pusher_full_chat_example/features/chat/models/chat_details_model.dart';
import 'package:pusher_full_chat_example/features/chat/models/custom_response.dart';

import '../mappers/custom_mapper.dart';

class ChatRepo {
  static Future<ChatDetailsModel> getChatDetails(
      {required int? firstUser, required int? secondUser}) async {
    var res = await DioHelper.getData(url: ApiEndPoints.provideRoom);
    CustomResponse response = CustomResponse.fromJson(res.data);
    ChatDetailsModel chatDetailsModel = mapCustomResponseToChatDetailsModel(response);
    return chatDetailsModel;
  }

  static sendMessage(
      {File? file,
      String? content,
      required int roomId,
      required int? userId,
      String type = "TEXT"}) async {
    Map<String, dynamic> data = {"conversation_id": 3};

    FormData formData = FormData.fromMap(data);

    log(formData.fields.toString());

    if (content != null) {
      formData.fields.add(MapEntry("message", content));
    }
    if (file != null) {
      formData.files.add(
        MapEntry(
            "message",
            await MultipartFile.fromFile(file.path,
                filename: file.path.split('/').last)),
      );
    }

    await DioHelper.postData(
        url: ApiEndPoints.send,
        data: formData);
  }
}
