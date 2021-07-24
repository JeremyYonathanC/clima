import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  String? api;

  Networking({this.api});

  getData() async {
    http.Response response = await http.get(
      Uri.parse(api!),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
