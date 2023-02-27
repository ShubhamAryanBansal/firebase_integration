
import 'package:dio/dio.dart';

import '../custom_shared_widgets/toast.dart';

class DataException implements Exception {

  static String message = "Unknown Exception";

  //DataException({this.message});

  DataException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'Your request has been cancelled';
        break;
      case DioErrorType.connectTimeout:
        message = 'Please Try Later! Your Network seems to be slow';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Please Try Later! Our great minds are fixing this';
        break;
      case DioErrorType.response:
        message = _handleError(dioError.response!.statusCode!);
        break;
      case DioErrorType.sendTimeout:
        message = 'Please Try Later! Our great minds are fixing this';
        break;
      default:  if(dioError.message == 'SocketException') {
        customException('noInternet');
      }
      break;
    }
  }

  static customException(String errorMessage) {
    if(errorMessage == 'noInternet'){
      showToast('Looks like your Internet Connection isn' 't there!',warning: true, duration: true,centerGravity: true);
    }
    message = 'Please Check if the Internet Connection is working!';
    return errorMessage;
  }

  String _handleError(int statusCode) {
    switch (statusCode) {
      default:
        return 'Please Try Later! Our great minds are fixing this';
    }
  }

  @override
  String toString() => message;
}
