import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final otpProvider = StateNotifierProvider<OtpNotifier, List<String>>((ref) {
  return OtpNotifier();
});

class OtpNotifier extends StateNotifier<List<String>> {
  OtpNotifier() : super(["", "", "", "", "", ""]);

  void updateOtp(int index, String value) {
    state = List.from(state)..[index] = value;
  }

  String get otp => state.join();
}


final userInfoProvider = StateProvider<Map<String, String>>((ref) => {});

final documentProvider = StateProvider<Map<String, String>>((ref) => {});