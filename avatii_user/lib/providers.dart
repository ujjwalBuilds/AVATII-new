// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final selectedIndexProvider = StateProvider<int>((ref) => 0);

// final otpProvider = StateNotifierProvider<OtpNotifier, List<String>>((ref) {
//   return OtpNotifier();
// });

// class OtpNotifier extends StateNotifier<List<String>> {
//   OtpNotifier() : super(["", "", "", "", "", ""]);

//   void updateOtp(int index, String value) {
//     state = List.from(state)..[index] = value;
//   }

//   String get otp => state.join();
// }


// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final selectedIndexProvider = StateProvider<int>((ref) => 0);

// final otpProvider = StateNotifierProvider<OtpNotifier, List<String>>((ref) {
//   return OtpNotifier();
// });

// class OtpNotifier extends StateNotifier<List<String>> {
//   OtpNotifier() : super(["", "", "", "", "", ""]);

//   void updateOtp(int index, String value) {
//     state = List.from(state)..[index] = value;
//   }

//   String get otp => state.join();

//   Future<void> sendOtp(String phoneNumber) async {
//     // Implement OTP sending logic
//   }

//   Future<void> verifyOtp(String phoneNumber, String otp) async {
//     // Implement OTP verification logic
//     if (otp != "expectedOtp") { // replace with real OTP logic
//       throw Exception("Invalid OTP");
//     }
//   }

//   void resendOtp(String phoneNumber) async {
//     await sendOtp(phoneNumber);
//   }
// }


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

  Future<void> sendOtp(String phoneNumber) async {
    // Implement OTP sending logic
  }

  Future<void> verifyOtp(String phoneNumber, String otp) async {
    // Implement OTP verification logic
    if (otp != "expectedOtp") { // replace with real OTP logic
      throw Exception("Invalid OTP");
    }
  }

  void resendOtp(String phoneNumber) async {
    await sendOtp(phoneNumber);
  }
}
