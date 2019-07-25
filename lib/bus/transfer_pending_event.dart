import 'package:event_taxi/event_taxi.dart';
import 'package:xpeed_wallet_flutter/network/model/response/pending_response.dart';

class TransferPendingEvent implements Event {
  final PendingResponse response;

  TransferPendingEvent({this.response});
}