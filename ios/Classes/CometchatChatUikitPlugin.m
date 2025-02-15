#import "CometchatChatUikitPlugin.h"
#if __has_include(<kaliro_chat_ui/kaliro_chat_ui-Swift.h>)
#import <kaliro_chat_ui/kaliro_chat_ui-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "kaliro_chat_ui-Swift.h"
#endif

@implementation CometchatChatUikitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCometchatChatUikitPlugin registerWithRegistrar:registrar];
}
@end
