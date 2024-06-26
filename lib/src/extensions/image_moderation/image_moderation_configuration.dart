import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

///[ImageModerationConfiguration] is a data class that has configuration properties
///to customize the functionality and appearance of [ImageModerationExtension]
///can be used by a component where [ImageModerationExtension] is a child component
///
/// ```dart
/// ImageModerationConfiguration(
///      style: ImageModerationFilterStyle(), warningText: "warning"
///  );
/// ```
class ImageModerationConfiguration {
  ImageModerationConfiguration({this.theme, this.warningText, this.style});

  ///[theme] sets custom theme
  final CometChatTheme? theme;

  ///[warningText] text shown if image has sensitive/graphic content
  final String? warningText;

  ///[style] provides styling to this ImageModerationFilter
  final ImageModerationFilterStyle? style;
}
