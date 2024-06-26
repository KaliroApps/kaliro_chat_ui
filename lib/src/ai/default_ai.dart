import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

///[CometChatUIKitChatAIFeatures] is a utility class that provides a list of default ai features
class CometChatUIKitChatAIFeatures {
  static List<AIExtension> getDefaultAiFeatures() {
    return [
      AISmartRepliesExtension(),
      AIConversationStarterExtension(),
      AIConversationSummaryExtension(),
      AIAssistBotExtension()
    ];
  }
}
