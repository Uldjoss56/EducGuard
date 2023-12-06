import 'package:connectivity_plus/connectivity_plus.dart';

class MyConnectivity {
  
  Future<String> check() async {
    print("HE");
    final  connectivityResult = await (Connectivity().checkConnectivity());
    print("HEl");
    if (connectivityResult == ConnectivityResult.mobile) {
      return "Mobile";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return "WiFi";
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      return "Ethernet";
    } else if (connectivityResult == ConnectivityResult.vpn) {
      return "VPN";
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      return "Bluetooth";
    } else if (connectivityResult == ConnectivityResult.other) {
      return "Other";
    } else if (connectivityResult == ConnectivityResult.none) {
      return "None";
    } else {
      return "None";
    }
  }
}
