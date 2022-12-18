import 'package:car_charging_station_app/components/marker.dart';
import 'package:car_charging_station_app/models/dto_user.dart';
import 'package:car_charging_station_app/network/network.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  UserData data = UserData();

  @observable
  DTOUser dtoUser = DTOUser();

  @observable
  User user = User();

  @observable
  List<LastSessions> lastSessions = [];

  @observable
  List<Nearby> nearby = [];

  @observable
  List<Marker> stationMarker = [
    //Verdiğiniz datada lat long değerleri aynı olduğu için ekstra marker eklendi.
    Marker(
      height: 50,
      point: LatLng(41.00, 28.99),
      builder: (context) => const StationMarker(),
    )
  ];

  @observable
  bool getData = false;

  @observable
  String displayName = "";

  @action
  getUserData() async {
    dtoUser = (await data.getUserData())!;
    lastSessions = dtoUser.lastSessions!;
    nearby = dtoUser.nearby!;
    user = dtoUser.user!;
    displayName = "${user.name} ${user.surname}";
    getData = true;
  }

  @action
  getStationMarkers() {
    for (int stationLength = 0;
        stationLength < dtoUser.nearby!.length;
        stationLength++) {
      stationMarker.add(
        Marker(
          height: 50,
          point: LatLng(
            dtoUser.nearby![stationLength].lat!.toDouble(),
            dtoUser.nearby![stationLength].lng!.toDouble(),
          ),
          builder: (context) =>
              dtoUser.nearby![stationLength].staus == "available"
                  ? const StationMarker()
                  : const StationMarkerBusy(),
        ),
      );
    }
  }
}
