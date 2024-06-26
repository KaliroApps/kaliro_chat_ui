import 'package:flutter/material.dart';
import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

///[TransferOwnershipStyle] is a data class that has styling-related properties
///to customize the appearance of [CometChatTransferOwnership]
class TransferOwnershipStyle extends BaseStyles {
  const TransferOwnershipStyle(
      {this.memberScopeStyle,
      this.submitIconTint,
      this.selectIconTint,
      super.width,
      super.height,
      super.background,
      super.gradient,
      super.border,
      super.borderRadius});

  ///[memberScopeStyle] is used to customize the appearance of the text in trailing widget
  final TextStyle? memberScopeStyle;

  ///[submitIconTint] will override the color of the default selection complete icon
  final Color? submitIconTint;

  ///[selectIconTint] will override the color of the default selection icon
  final Color? selectIconTint;
}
