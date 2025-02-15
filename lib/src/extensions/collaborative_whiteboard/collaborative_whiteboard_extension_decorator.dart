import 'package:flutter/material.dart';

import '../../../../../kaliro_chat_ui.dart';

///[CollaborativeWhiteBoardExtensionDecorator] is a the view model for [CollaborativeWhiteBoardExtension] it contains all the relevant business logic
///it is also a sub-class of [DataSourceDecorator] which allows any extension to override the default methods provided by [MessagesDataSource]
class CollaborativeWhiteBoardExtensionDecorator extends DataSourceDecorator {
  String collaborativeWhiteBoardExtensionTypeConstant =
      ExtensionType.whiteboard;
  CollaborativeWhiteBoardConfiguration? configuration;

  User? loggedInUser;

  CollaborativeWhiteBoardExtensionDecorator(super.dataSource,
      {this.configuration}) {
    getLoggedInUser();
  }

  getLoggedInUser() async {
    loggedInUser = await CometChat.getLoggedInUser();
  }

  @override
  String getId() {
    return "CollaborativeWhiteBoard";
  }

  @override
  List<String> getAllMessageTypes() {
    List<String> ab = super.getAllMessageTypes();
    ab.add(collaborativeWhiteBoardExtensionTypeConstant);

    return ab;
  }

  @override
  List<String> getAllMessageCategories() {
    List<String> categoryList = super.getAllMessageCategories();
    if (!categoryList.contains(MessageCategoryConstants.custom)) {
      categoryList.add(MessageCategoryConstants.custom);
    }
    return categoryList;
  }

  @override
  List<CometChatMessageTemplate> getAllMessageTemplates(
      {CometChatTheme? theme}) {
    CometChatTheme theme0 = theme ?? cometChatTheme;

    List<CometChatMessageTemplate> templateList =
        super.getAllMessageTemplates(theme: theme0);

    templateList.add(getTemplate(theme: theme0));

    return templateList;
  }

  @override
  List<CometChatMessageComposerAction> getAttachmentOptions(
      CometChatTheme theme, BuildContext context, Map<String, dynamic>? id) {
    List<CometChatMessageComposerAction> actions =
        super.getAttachmentOptions(theme, context, id);

    if (isNotThread(id)) {
      actions.add(getAttachmentOption(theme, context, id));
    }

    return actions;
  }

  @override
  String getLastConversationMessage(
      Conversation conversation, BuildContext context) {
    BaseMessage? message = conversation.lastMessage;
    if (message != null &&
        message.type == collaborativeWhiteBoardExtensionTypeConstant &&
        message.category == MessageCategoryConstants.custom) {
      return Translations.of(context).customMessageWhiteboard;
    } else {
      return super.getLastConversationMessage(conversation, context);
    }
  }

  CometChatMessageTemplate getTemplate({CometChatTheme? theme}) {
    CometChatTheme theme0 = theme ?? cometChatTheme;

    return CometChatMessageTemplate(
        type: collaborativeWhiteBoardExtensionTypeConstant,
        category: CometChatMessageCategory.custom,
        contentView: (BaseMessage message, BuildContext context,
            BubbleAlignment alignment,
            {AdditionalConfigurations? additionalConfigurations}) {
          return getContentView(message as CustomMessage, theme0, context);
        },
        options: CometChatUIKit.getDataSource().getCommonOptions,
        bottomView: CometChatUIKit.getDataSource().getBottomView);
  }

  Widget getContentView(
      CustomMessage customMessage, CometChatTheme theme, BuildContext context) {
    if (customMessage.deletedAt != null) {
      return super.getDeleteMessageBubble(customMessage, theme);
    }
    return CometChatCollaborativeWhiteBoardBubble(
      url: getWebViewUrl(customMessage),
      style: WhiteBoardBubbleStyle(
          background: configuration?.style?.background,
          dividerColor: configuration?.style?.dividerColor,
          buttonTextStyle: configuration?.style?.buttonTextStyle,
          subtitleStyle: configuration?.style?.subtitleStyle,
          titleStyle: configuration?.style?.titleStyle,
          iconTint: configuration?.style?.iconTint,
          webViewAppBarColor: configuration?.style?.webViewAppBarColor,
          webViewBackIconColor: configuration?.style?.webViewBackIconColor,
          webViewTitleStyle: configuration?.style?.webViewTitleStyle),
    );
  }

  sendCollaborativeWhiteBoard(BuildContext context, String receiverID,
      String receiverType, CometChatTheme theme) {
    CometChat.callExtension(
        ExtensionConstants.whiteboard,
        "POST",
        ExtensionUrls.whiteboard,
        {"receiver": receiverID, "receiverType": receiverType},
        onSuccess: (Map<String, dynamic> map) {
      debugPrint("Success map $map");
    }, onError: (CometChatException e) {
      debugPrint('$e');
      String error = getErrorTranslatedText(context, e.code);
      showCometChatConfirmDialog(
          context: context,
          messageText: Text(
            error,
            style: TextStyle(
                fontSize: theme.typography.title2.fontSize,
                fontWeight: theme.typography.title2.fontWeight,
                color: theme.palette.getAccent(),
                fontFamily: theme.typography.title2.fontFamily),
          ),
          confirmButtonText: Translations.of(context).tryAgain,
          cancelButtonText: Translations.of(context).cancelCapital,
          onConfirm: () {
            Navigator.pop(context);
            sendCollaborativeWhiteBoard(
                context, receiverID, receiverType, theme);
          });
    });
  }

  CometChatMessageComposerAction getAttachmentOption(
      CometChatTheme theme, BuildContext context, Map<String, dynamic>? id) {
    return CometChatMessageComposerAction(
        id: collaborativeWhiteBoardExtensionTypeConstant,
        title: configuration?.optionTitle ??
            Translations.of(context).collaborativeWhiteboard,
        iconUrl: configuration?.optionIconUrl ??
            AssetConstants.collaborativeWhiteboard,
        iconUrlPackageName:
            configuration?.optionIconUrlPackageName ?? UIConstants.packageName,
        titleStyle: TextStyle(
                color: theme.palette.getAccent(),
                fontSize: theme.typography.subtitle1.fontSize,
                fontWeight: theme.typography.subtitle1.fontWeight)
            .merge(configuration?.optionStyle?.titleStyle),
        iconTint: configuration?.optionStyle?.iconTint ??
            theme.palette.getAccent700(),
        background: configuration?.optionStyle?.background,
        cornerRadius: configuration?.optionStyle?.cornerRadius,
        iconBackground: configuration?.optionStyle?.iconBackground,
        iconCornerRadius: configuration?.optionStyle?.iconCornerRadius,
        onItemClick: (context, user, group) {
          String? uid, guid;
          String receiverType = '';
          if (user != null) {
            uid = user.uid;
            receiverType = ReceiverTypeConstants.user;
          }
          if (group != null) {
            guid = group.guid;
            receiverType = ReceiverTypeConstants.group;
          }

          if (uid != null || guid != null) {
            sendCollaborativeWhiteBoard(
                context, uid ?? guid ?? '', receiverType, theme);
          }
        });
  }

  String? getWebViewUrl(CustomMessage? messageObject) {
    if (messageObject != null &&
        messageObject.customData != null &&
        messageObject.customData!.containsKey("whiteboard")) {
      Map? whiteboard = messageObject.customData?["whiteboard"];
      if (whiteboard != null && whiteboard.containsKey("board_url")) {
        return whiteboard["board_url"];
      }
    }
    return null;
  }

  String getErrorTranslatedText(BuildContext context, String errorCode) {
    if (errorCode == "ERROR_INTERNET_UNAVAILABLE") {
      return Translations.of(context).errorInternetUnavailable;
    } else {}

    return Translations.of(context).somethingWentWrongError;
  }

  bool isNotThread(Map<String, dynamic>? id) {
    int? parentMessageId;
    if (id != null && id.containsKey('parentMessageId')) {
      parentMessageId = id['parentMessageId'];
    }
    return parentMessageId == 0 || parentMessageId == null;
  }
}
