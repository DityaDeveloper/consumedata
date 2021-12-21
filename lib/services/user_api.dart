 import 'dart:convert';
import 'dart:io';

import 'package:consumedata/model/api_response.dart';
import 'package:consumedata/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserListingApi {

Future<List<User>> getListUser() async {

    ApiResponse _apiResponse = new ApiResponse();

    final endpointUserList = "https://reqres.in/api/users?page=2";

    try {
      final response = await http.get(endpointUserList, 
      headers: {}, 
     );
      switch (response.statusCode) {
        case 200:
          if (response.statusCode == 200) {
            var responseJson = jsonDecode(response.body);
        print(responseJson);
            return (responseJson['data'] as List)
                .map((p) => User.fromJson(p))
                .toList();
          } else {
            throw Exception('Failed to load task list');
          }
          break;
        default:
          return null;
        // _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
      }
    } on SocketException {
     return null;
    }
  }
}
