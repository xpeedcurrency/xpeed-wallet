import 'package:event_taxi/event_taxi.dart';
import 'package:xpeed_wallet_flutter/network/model/response/block_info_item.dart';

class BlocksInfoEvent implements Event {
  final BlockInfoItem response;

  BlocksInfoEvent({this.response});
}