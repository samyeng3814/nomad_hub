import 'dart:io';

class InternetConnetivity {
  Future<bool> isConnected() async{
    try{
      var result = await InternetAddress.lookup('google.com');
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
        return true;
      }
      return false;
    } on SocketException catch(_){
      return false;
    }
  }
}