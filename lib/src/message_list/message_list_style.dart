import 'package:flutter/material.dart';
import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

///[MessageListStyle] is a data class that has styling-related properties
///to customize the appearance of [CometChatMessageList]
class MessageListStyle extends BaseStyles {
  const MessageListStyle({
    this.loadingIconTint,
    this.emptyTextStyle,
    this.errorTextStyle,
    this.contentPadding,
    super.width,
    super.height,
    super.background,
    super.border,
    super.borderRadius,
    super.gradient,
  });

  ///[loadingIconTint] provides color to loading icon
  final Color? loadingIconTint;

  ///[emptyTextStyle] provides styling for text to indicate message list is empty
  final TextStyle? emptyTextStyle;

  ///[errorTextStyle] provides styling for text to indicate some error has occured while fetching the message list
  final TextStyle? errorTextStyle;

  final EdgeInsetsGeometry? contentPadding;
}
