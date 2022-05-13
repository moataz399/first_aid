import 'package:dio/dio.dart';

class WebServices {
  late Dio dio;

  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://first-aid-api.herokuapp.com/api/fields?partial=full",
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future getData() async {
    try {
      Response response = await dio
          .get('https://first-aid-api.herokuapp.com/api/fields?partial=full');
      print("api data " + response.data.toString());

      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
