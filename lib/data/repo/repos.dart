import 'package:first_aid/data/models/data_model.dart';
import 'package:first_aid/data/web_services/web_services.dart';

import '../web_services/web_services.dart';

class Repository {
  final WebServices webServices;

  Repository({required this.webServices});

  Future<FirstAidData> getData() async {
    final result = await webServices.getData();
    print('Getting data Repo');
    print(result);
    return FirstAidData.fromJson(result);
  }
}
