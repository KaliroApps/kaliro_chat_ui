import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

///[CometChatUIKitChatExtensions] is a utility class that provides a list of default extensions
class CometChatUIKitChatExtensions {
  static List<ExtensionsDataSource> getDefaultExtensions() {
    return [
      TextModerationExtension(),
      StickersExtension(),
      CollaborativeDocumentExtension(),
      CollaborativeWhiteBoardExtension(),
      ImageModerationExtension(),
      LinkPreviewExtension(),
      MessageTranslationExtension(),
      PollsExtension(),
      SmartReplyExtension(),
      ThumbnailGenerationExtension(),
    ];
  }
}
