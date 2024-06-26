import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

///[AISmartRepliesExtension] is the controller class for enabling and disabling the extension
///enabling this extension would display smart replies to send.
class AISmartRepliesExtension extends AIExtension {
  AISmartRepliesConfiguration? configuration;

  AISmartRepliesExtension({this.configuration});

  @override
  void addExtension() {
    ChatConfigurator.enable((dataSource) =>
        AISmartRepliesDecorator(dataSource, configuration: configuration));
  }

  @override
  String getExtensionId() {
    return AIFeatureConstants.aiSmartReplies;
  }
}
