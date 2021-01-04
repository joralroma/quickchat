import 'dart:async';
import 'package:flutter/services.dart';
import 'package:pusher_websocket_flutter/pusher.dart';

class PusherService {

  Event lastEvent;
  String lastConnectionState;
  Channel channel;


  StreamController<String> _eventData = StreamController<String>();
  Stream get eventStream => _eventData.stream;

  Future<void> initPusher() async {
    try {
      await Pusher.init('d0099e65ff98718c29ef', PusherOptions(cluster: 'us2'));
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  void connectPusher() {
    Pusher.connect(
      onConnectionStateChange: (ConnectionStateChange connectionState) async {
      lastConnectionState = connectionState.currentState;
    }, onError: (ConnectionError e) {
      print("Error: ${e.message}");
    });
  }

  Future<void> subscribePusher(String channelName) async {
    channel = await Pusher.subscribe(channelName);
  }

  void unSubscribePusher(String channelName) {
    Pusher.unsubscribe(channelName);
  }

  Future<void> firePusher(String channelName, String eventName, Function(String) onChange) async {
    await initPusher();
    connectPusher();
    await subscribePusher(channelName);
    bindEvent(eventName, onChange);
  }

 void bindEvent(String eventName, Function(String) onChange) {
    channel.bind(eventName, (last) {
      final String data = last.data;
      onChange(data);
    });
  }

  void unbindEvent(String eventName) {
    channel.unbind(eventName);
    _eventData.close();
  }

}