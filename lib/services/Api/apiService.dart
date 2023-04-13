import 'package:dio/dio.dart';
import 'package:enayas_app/services/configs/appConfigs.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/snackbar.dart';

class ApiService {
  static Future<Response?> post({
    required url,
    data,
    Map<String, dynamic>? headers,
  }) async {
    print('Body:::${data.toString()}');
    try {
      final res = await Apputils.dio
          .post(
            baseUrl + url,
            data: data,
            options: Options(
              headers: headers ??
                  {
                    'Authorization':
                        'Bearer ${Apputils.getStorage.read(Apputils.accessToken)}',
                    'Content-Type': 'application/json',
                  },
            ),
          )
          .timeout(Duration(seconds: 30));

      print(res.realUri);
      print(res.statusCode);

      if (res.statusCode == 201 || res.statusCode == 200) {
        return res;
      } else {
        serverErrorSnackbar();
      }
    // ignore: unused_catch_clause
    } on DioError catch (e) {
      serverErrorSnackbar();
      // serverErrorSnackbar(errorText: e.message.toString());
    }
    return null;
  }

//
  static Future<Response?> get({
    required String endPoint,
    Map<String, dynamic>? headers,
  }) async {
    print('End Point Api : $baseUrl$endPoint');

    final res = await Apputils.dio.get(
      baseUrl + endPoint,
      options: Options(
        headers: headers ??
            {
              'Authorization':
                  'Bearer ${Apputils.getStorage.read(Apputils.accessToken)}',
              'Content-Type': 'application/json',
            },
      ),
    );

    // print(res.data);
    print(res.realUri);
    print(res.statusCode);

    if (res.statusCode == 200) {
      return res;
    } else {
      serverErrorSnackbar();
    }
    return null;
  }
}
