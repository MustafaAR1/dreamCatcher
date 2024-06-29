// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:myapp/Network/dio_client_network.dart';


// class DioApiServices {
//   static String? authToken;
//   final Function()? onAPIErrorDetection;
//   final Function(
//     String? url,
//     Response? response,
//     String dioError,
//   )? onError;

//   DioApiServices({
//     this.onAPIErrorDetection,
//     this.onError,
//   });

//   final _internetError = {
//     'message': 'Please check your internet connection',
//     'errorCode': 'internet_connection_error',
//   };

//   Future<bool> _checkInternetConnectivity() async {
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         return true;
//       }
//     } catch (_) {
//       return false;
//     }
//     return false;
//   }

//   Future<dynamic> getRequest(
//     String? uri, {
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//     dynamic data,
//   }) async {
//     try {
//       final connected = await _checkInternetConnectivity();
//       if (connected) {
//         final response = await getIt<DioClientNetwork>().dio.request(
//               uri!,
//               queryParameters: queryParameters,
//               options: options,
//               cancelToken: cancelToken,
//               onReceiveProgress: onReceiveProgress,
//               data: data,
//             );
//         return response.data;
//       } else {
//         return _internetError;
//       }
//     } on SocketException catch (e) {
//       return NetworkExceptions.getDioException(
//         e,
//         onAPIErrorDetection,
//         uri,
//         onError: onError,
//       );
//     } on FormatException catch (err) {
//       return NetworkExceptions.getDioException(
//         err,
//         onAPIErrorDetection,
//         uri,
//         onError: onError,
//       );
//     } catch (e) {
//       return NetworkExceptions.getDioException(
//         e,
//         onAPIErrorDetection,
//         uri,
//         onError: onError,
//       );
//     }
//   }

//   Future<dynamic> postRequest(
//     String? uri, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final connected = await _checkInternetConnectivity();
//       if (connected) {
//         final response = await getIt<DioClientNetwork>().dio.post(
//               uri!,
//               data: data,
//               queryParameters: queryParameters,
//               options: options,
//               cancelToken: cancelToken,
//               onSendProgress: onSendProgress,
//               onReceiveProgress: onReceiveProgress,
//             );
//         return response.data;
//       } else {
//         return _internetError;
//       }
//     } on DioError catch (e) {
//       return NetworkExceptions.getDioException(
//         e,
//         onAPIErrorDetection,
//         uri,
//         onError: onError,
//       );
//     }
//   }

//   Future<dynamic> deleteRequest(
//     String? uri, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final connected = await _checkInternetConnectivity();
//       if (connected) {
//         final response = await getIt<DioClientNetwork>().dio.delete(
//               uri!,
//               data: data,
//               queryParameters: queryParameters,
//               options: options,
//               cancelToken: cancelToken,
//             );
//         return response.data;
//       } else {
//         return _internetError;
//       }
//     } on SocketException catch (e) {
//       return NetworkExceptions.getDioException(
//         e,
//         onAPIErrorDetection,
//         uri,
//         onError: onError,
//       );
//     } on FormatException catch (err) {
//       return NetworkExceptions.getDioException(
//         err,
//         onAPIErrorDetection,
//         uri,
//         onError: onError,
//       );
//     } catch (e) {
//       return NetworkExceptions.getDioException(
//         e,
//         onAPIErrorDetection,
//         uri,
//         onError: onError,
//       );
//     }
//   }

//   Future<dynamic> patchRequest(
//     String? uri, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final connected = await _checkInternetConnectivity();
//       if (connected) {
//         final response = await getIt<DioClientNetwork>().dio.patch(
//               uri!,
//               data: data,
//               queryParameters: queryParameters,
//               options: options,
//               cancelToken: cancelToken,
//               onSendProgress: onSendProgress,
//               onReceiveProgress: onReceiveProgress,
//             );
//         return response.data;
//       } else {
//         return _internetError;
//       }
//     } on SocketException catch (e) {
//       return NetworkExceptions.getDioException(
//         e,
//         onAPIErrorDetection,
//         uri,
//         onError: onError,
//       );
//     } on FormatException catch (err) {
//       return NetworkExceptions.getDioException(
//         err,
//         onAPIErrorDetection,
//         uri,
//         onError: onError,
//       );
//     } catch (e) {
//       return NetworkExceptions.getDioException(
//         e,
//         onAPIErrorDetection,
//         uri,
//         onError: onError,
//       );
//     }
//   }
// }

// abstract class NetworkExceptions {
//   static Future<Map<String, dynamic>?> getDioException(
//     Object error,
//     Function()? onAPIErrorDetection,
//     String? url, {
//     required Function(
//       String? url,
//       Response? response,
//       String dioError,
//     )? onError,
//   }) async {
//     try {
//       if (error is DioError && error.error is! SocketException) {
//         if (onError != null) {
//           try {
//             await onError(url, error.response, error.error);
//           } catch (e) {
//             LoggerUtil.logs('Dio onError $e');
//           }
//         }
//         switch (error.response?.statusCode) {
//           case 402:
//             if (onAPIErrorDetection != null) await onAPIErrorDetection();
//             return {
//               'status': false,
//               'message': StringConstants.loginExpired,
//             };
//           case 401:
//             await _onUnAuthorized();
//             await Restart.restartApp();
//             break;
//           default:
//             return {
//               'status': false,
//               'message': error.response?.data['message'],
//               'data': error.response?.data['data'],
//             };
//         }
//       } else {
//         return {
//           'status': false,
//           'message': 'Unexpected error occurred',
//           'code': 500
//         };
//       }
//     } catch (_) {
//       return {
//         'status': false,
//         'message': 'Unexpected error occurred',
//         'code': 500
//       };
//     }
//   }

//   static Future<void> _onUnAuthorized() async {
//     await getIt<SharedPreferencesUtil>().setBool(
//       SharedPreferenceConstants.isLoginBool,
//       value: false,
//     );
//     await getIt<SharedPreferencesUtil>().setBool(
//       SharedPreferenceConstants.isEatryBool,
//       value: false,
//     );
//     await getIt<SharedPreferencesUtil>()
//         .removeValue(SharedPreferenceConstants.token);
//     await getIt<SharedPreferencesUtil>()
//         .removeValue(SharedPreferenceConstants.userObj);
//     await getIt<SharedPreferencesUtil>()
//         .removeValue(SharedPreferenceConstants.fcm);
//   }
// }
