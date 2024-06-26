import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

///[LinkPreviewExtension] is the controller class for enabling and disabling the extension
///its shows previews for links that have open graph image and favicon declared in meta data to web page and also the link should follow http(s) scheme
class LinkPreviewExtension extends ExtensionsDataSource {
  LinkPreviewConfiguration? configuration;
  LinkPreviewExtension({this.configuration});

  @override
  void addExtension() {
    ChatConfigurator.enable((dataSource) => LinkPreviewExtensionDecorator(
        dataSource,
        configuration: configuration));
  }

  @override
  String getExtensionId() {
    return "link-preview";
  }
}
