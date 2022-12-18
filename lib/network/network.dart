import 'package:car_charging_station_app/models/dto_user.dart';
import 'package:dio/dio.dart';

class UserData {
  Future<DTOUser?> getUserData() async {
    DTOUser dtoUser = DTOUser();
    try {
      var response = await Dio()
          .get('https://turuncuweb.net/services/charge/user.mock.json');

      dtoUser = DTOUser.fromJson(response.data);

      return dtoUser;
    } catch (e) {
      rethrow;
    }
  }
}
