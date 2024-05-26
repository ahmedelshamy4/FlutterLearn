import 'package:dio/dio.dart';
import 'package:flutter_learn/core/constats/api_constants.dart';
import 'package:flutter_learn/core/constats/dio_helper.dart';
import 'package:flutter_learn/initialize_app_config.dart';

class DataDi {
  static Future<void> initialize() async {
    injector.registerLazySingleton<Dio>(
      () {
        return Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseUrl,
            receiveDataWhenStatusError: true,
          ),
        );
      },
    );

    injector.registerLazySingleton(() => DioHelper(
          injector.get(),
        ));
  }
}
