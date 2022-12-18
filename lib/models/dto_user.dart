import 'package:json_annotation/json_annotation.dart';
part 'dto_user.g.dart';

@JsonSerializable()
class DTOUser {
  User? user;
  List<LastSessions>? lastSessions;
  List<Nearby>? nearby;

  DTOUser({this.user, this.lastSessions, this.nearby});

  @override
  DTOUser.fromJson(Map<dynamic, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['last_sessions'] != null) {
      lastSessions = <LastSessions>[];
      json['last_sessions'].forEach((v) {
        lastSessions!.add(LastSessions.fromJson(v));
      });
    }
    if (json['nearby'] != null) {
      nearby = <Nearby>[];
      json['nearby'].forEach((v) {
        nearby!.add(Nearby.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (lastSessions != null) {
      data['last_sessions'] = lastSessions!.map((v) => v.toJson()).toList();
    }
    if (nearby != null) {
      data['nearby'] = nearby!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? surname;
  double? balance;
  List<Adresses>? adresses;

  User({this.id, this.name, this.surname, this.balance, this.adresses});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    balance = json['balance'];
    if (json['adresses'] != null) {
      adresses = <Adresses>[];
      json['adresses'].forEach((v) {
        adresses!.add(Adresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['balance'] = balance;
    if (adresses != null) {
      data['adresses'] = adresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Adresses {
  String? title;
  String? address;
  int? lat;
  int? lng;

  Adresses({this.title, this.address, this.lat, this.lng});

  Adresses.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['address'] = address;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class LastSessions {
  String? title;
  String? cp;
  int? lat;
  int? lng;
  String? date;
  int? usage;
  String? duration;
  int? times;

  LastSessions(
      {this.title,
      this.cp,
      this.lat,
      this.lng,
      this.date,
      this.usage,
      this.duration,
      this.times});

  LastSessions.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cp = json['cp'];
    lat = json['lat'];
    lng = json['lng'];
    date = json['date'];
    usage = json['usage'];
    duration = json['duration'];
    times = json['times'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['cp'] = cp;
    data['lat'] = lat;
    data['lng'] = lng;
    data['date'] = date;
    data['usage'] = usage;
    data['duration'] = duration;
    data['times'] = times;
    return data;
  }
}

class Nearby {
  String? title;
  int? lat;
  int? lng;
  String? staus;

  Nearby({this.title, this.lat, this.lng, this.staus});

  Nearby.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    lat = json['lat'];
    lng = json['lng'];
    staus = json['staus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['lat'] = lat;
    data['lng'] = lng;
    data['staus'] = staus;
    return data;
  }
}
