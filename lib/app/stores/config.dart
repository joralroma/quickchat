const bool isProduction = bool.fromEnvironment('dart.vm.product');

class Config {

  bool prod = isProduction;
  String urlLoginDev   = 'https://quick-chat2020.herokuapp.com/api/';
  String urlLoginProd  = 'https://quick-chat2020.herokuapp.com/api/';

}
