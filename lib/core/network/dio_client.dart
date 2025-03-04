import 'package:dio/dio.dart';
import 'package:valorant_intel/core/constants/api_constants.dart';
import 'package:valorant_intel/core/utils/network_utils.dart';

class DioClient {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  final NetworkUtils _networkUtils;
  DioClient({required NetworkUtils networkUtils})
      : _networkUtils = networkUtils {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.queryParameters['language'] =
              await _networkUtils.getLanguageCode();
          return handler.next(options);
        },
      ),
    );
  }
}
