import 'package:flutter_learn/initialize_app_config.dart';
import 'package:flutter_learn/simple_video/data/data_source/local_video_data_source_imp.dart';

class DataDi {
  static Future<void> initialize() async {
    injector.registerSingleton<LocalVideoDatasourceImp>(LocalVideoDatasourceImp());

  }
}
