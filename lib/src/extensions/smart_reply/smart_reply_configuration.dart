import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

///[SmartReplyConfiguration] is a data class that has configuration properties
///to customize the functionality and appearance of [SmartReplyExtension]
///
/// ```dart
///   SmartReplyConfiguration(
///    style: SmartReplyStyle(),
///    theme: CometChatTheme(palette: Palette(),typography: Typography())
///  );
/// ```
class SmartReplyConfiguration {
  SmartReplyConfiguration({this.style, this.theme});

  ///[style] for smart replies
  final SmartReplyStyle? style;

  ///[theme] sets custom theme
  final CometChatTheme? theme;
}
