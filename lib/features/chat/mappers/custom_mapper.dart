import '../models/chat_details_model.dart';
import '../models/custom_response.dart';

ChatDetailsModel mapCustomResponseToChatDetailsModel(CustomResponse customResponse) {
  return ChatDetailsModel(
    chats: Chats(roomId: -1),
    messages: customResponse.data?.map((dataItem) {
      return Message(
        id: dataItem.id,
        content: dataItem.message,
        type: dataItem.type,
        sentAt: dataItem.createdAt,
        sender: Sender(
          id: dataItem.id,
          roleId: null,
          name: "Sender Name",
          email: "Sender Email",
          avatar: "Sender Avatar",
          emailVerifiedAt: null,
          settings: Settings(locale: null), // Placeholder for settings
          createdAt: dataItem.createdAt != null ? DateTime.tryParse(dataItem.createdAt!) : null,
          updatedAt: dataItem.createdAt != null ? DateTime.tryParse(dataItem.createdAt!) : null,
        ),
      );
    }).toList(),
  );
}