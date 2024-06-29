// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:eats_app/main.dart';
// import 'package:eats_app/src/constants/http_constants.dart';
// import 'package:eats_app/src/constants/shared_preference_constants.dart';
// import 'package:eats_app/src/network/dio_api_services.dart';
// import 'package:eats_app/src/utils/logger_util.dart';
// import 'package:eats_app/src/utils/shared_preference_util.dart';
// import 'package:flutter/foundation.dart';

// class DioClientNetwork {
//   late Dio dio;

//   String? getAuthToken() {
//     return DioApiServices.authToken;
//   }

//   Future<void> initializeDioClientNetwork({
//     String? token,
//     String? eatryId,
//     bool deleteToken = false,
//     String? userId,
//     bool isUserIDRequired = false,
//   }) async {
//     dio = Dio();
//     dio.interceptors.add(
//       LogInterceptor(
//         responseBody: !kReleaseMode,
//         requestBody: !kReleaseMode,
//         logPrint:  LoggerUtil.logs
//       ),
//     );
//     final savetoken = await getIt<SharedPreferencesUtil>()
//         .getString(SharedPreferenceConstants.token);
//     final getUserId = await getIt<SharedPreferencesUtil>()
//         .getString(SharedPreferenceConstants.userId);
//     if (isUserIDRequired) {
//       dio.options = setBaseOptions()
//         ..headers['Authorization'] = 'Bearer ${token ?? savetoken}'
//         ..headers['user_id'] = userId ?? getUserId
//         ..headers['device'] = Platform.isIOS ? 'IOS' : 'Android';
//     } else {
//       dio.options = setBaseOptions()
//         ..headers['Authorization'] = 'Bearer ${token ?? savetoken}'
//         ..headers['device'] = Platform.isIOS ? 'IOS' : 'Android';
//     }
//     if (token != null) {
//       await getIt<SharedPreferencesUtil>()
//           .setString(SharedPreferenceConstants.token, token);
//       // await getIt<SharedPreferencesUtil>().setString(SharedPreferenceConstants.userId,userId);
//     }
//     if (userId != null) {
//       await getIt<SharedPreferencesUtil>()
//           .setString(SharedPreferenceConstants.userId, userId);
//     }
//     if (deleteToken == true) {
//       dio.options = setBaseOptions()
//         ..headers['Authorization'] = null
//         ..headers['user_id'] = null;
//       await getIt<SharedPreferencesUtil>()
//           .setString(SharedPreferenceConstants.token, null);
//       await getIt<SharedPreferencesUtil>()
//           .setString(SharedPreferenceConstants.userId, null);
//     }
//   }

//   BaseOptions setBaseOptions() {
//     return BaseOptions(
//       connectTimeout: 300000,
//       baseUrl: HttpConstants.base,
//     );
//   }
// }
