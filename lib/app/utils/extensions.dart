import 'package:chatquick/app/models/chat.dart';
import 'package:chatquick/app/models/msm.dart';
import 'package:chatquick/app/stores/data.dart';


extension IntExtensions on int {
  String get toComplete {
    return (this < 10) ? '0$this' : '$this';
  }
}

extension StringExtensions on String {

  bool get isValid {
    return (this != null && this.isNotEmpty && this.length <= 30);
  }

  String get toDate {
    String result = '';
    try {
      DateTime date = DateTime.parse(this);
      date = date.subtract(const Duration(hours: 5));
      result = '${date.hour.toComplete}:${date.minute.toComplete}';
    } catch (e) {
    }
    return result;
  }

}

extension ListChatDataExtensions on List<ChatData> {

  static MyData _myData = MyData.instance;

  String get getLastMsm {
    if(this.isNotEmpty) {
      return this.last?.text ?? '';
    }
    return '';
  }

  List<Msm> get toMsms {
    List<Msm> result = [];
    if(_myData.myUser != null) {
      final String myUserId = _myData.myUser.id;
      Msm msm;
      for (var item in this) {
        msm = Msm(
          item.fromUserId.id == myUserId,
          item.text,
          item.creationDate
        );
        result.add(msm);
      }
    }
    return result;
  }

}