import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

///[ImageModerationExtension] is the controller class for enabling and disabling the extension
///it censors images with graphic content
class ImageModerationExtension extends ExtensionsDataSource {
  ImageModerationConfiguration? configuration;
  ImageModerationExtension({this.configuration});

  @override
  void addExtension() {
    ChatConfigurator.enable((dataSource) => ImageModerationExtensionDecorator(
        dataSource,
        configuration: configuration));
  }

  @override
  String getExtensionId() {
    return "image-moderation";
  }
}
