import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// 의존성 주입을 위한 DioClient 클래스
class DioClient {
  static Dio getClient() {
    final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/movie/",
      headers: {
        "Authorization":
            "Bearer ${const String.fromEnvironment("TMDB_ACCESS_TOKEN")}"
      },
    ));

    dio.interceptors.add(PrettyDioLogger());
    return dio;
  }
}
