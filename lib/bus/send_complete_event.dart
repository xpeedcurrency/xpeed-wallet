import 'package:event_taxi/event_taxi.dart';
import 'package:xpeed_wallet_flutter/model/state_block.dart';

class SendCompleteEvent implements Event {
  final StateBlock previous;

  SendCompleteEvent({this.previous});
}