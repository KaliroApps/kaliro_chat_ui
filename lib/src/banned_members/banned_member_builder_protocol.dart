import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

abstract class BannedMemberBuilderProtocol extends BuilderProtocol<
    BannedGroupMembersRequestBuilder, BannedGroupMembersRequest> {
  const BannedMemberBuilderProtocol(super.builder);
}

class UIBannedMemberBuilder extends BannedMemberBuilderProtocol {
  const UIBannedMemberBuilder(super.builder);

  @override
  BannedGroupMembersRequest getRequest() {
    return requestBuilder.build();
  }

  @override
  BannedGroupMembersRequest getSearchRequest(String val) {
    requestBuilder.searchKeyword = val;
    return requestBuilder.build();
  }
}
