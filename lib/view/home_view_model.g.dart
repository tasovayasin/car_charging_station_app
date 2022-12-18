// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$dtoUserAtom =
      Atom(name: 'HomeViewModelBase.dtoUser', context: context);

  @override
  DTOUser get dtoUser {
    _$dtoUserAtom.reportRead();
    return super.dtoUser;
  }

  @override
  set dtoUser(DTOUser value) {
    _$dtoUserAtom.reportWrite(value, super.dtoUser, () {
      super.dtoUser = value;
    });
  }

  late final _$userAtom =
      Atom(name: 'HomeViewModelBase.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$lastSessionsAtom =
      Atom(name: 'HomeViewModelBase.lastSessions', context: context);

  @override
  List<LastSessions> get lastSessions {
    _$lastSessionsAtom.reportRead();
    return super.lastSessions;
  }

  @override
  set lastSessions(List<LastSessions> value) {
    _$lastSessionsAtom.reportWrite(value, super.lastSessions, () {
      super.lastSessions = value;
    });
  }

  late final _$nearbyAtom =
      Atom(name: 'HomeViewModelBase.nearby', context: context);

  @override
  List<Nearby> get nearby {
    _$nearbyAtom.reportRead();
    return super.nearby;
  }

  @override
  set nearby(List<Nearby> value) {
    _$nearbyAtom.reportWrite(value, super.nearby, () {
      super.nearby = value;
    });
  }

  late final _$stationMarkerAtom =
      Atom(name: 'HomeViewModelBase.stationMarker', context: context);

  @override
  List<Marker> get stationMarker {
    _$stationMarkerAtom.reportRead();
    return super.stationMarker;
  }

  @override
  set stationMarker(List<Marker> value) {
    _$stationMarkerAtom.reportWrite(value, super.stationMarker, () {
      super.stationMarker = value;
    });
  }

  late final _$getDataAtom =
      Atom(name: 'HomeViewModelBase.getData', context: context);

  @override
  bool get getData {
    _$getDataAtom.reportRead();
    return super.getData;
  }

  @override
  set getData(bool value) {
    _$getDataAtom.reportWrite(value, super.getData, () {
      super.getData = value;
    });
  }

  late final _$displayNameAtom =
      Atom(name: 'HomeViewModelBase.displayName', context: context);

  @override
  String get displayName {
    _$displayNameAtom.reportRead();
    return super.displayName;
  }

  @override
  set displayName(String value) {
    _$displayNameAtom.reportWrite(value, super.displayName, () {
      super.displayName = value;
    });
  }

  late final _$getUserDataAsyncAction =
      AsyncAction('HomeViewModelBase.getUserData', context: context);

  @override
  Future getUserData() {
    return _$getUserDataAsyncAction.run(() => super.getUserData());
  }

  late final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase', context: context);

  @override
  dynamic getStationMarkers() {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.getStationMarkers');
    try {
      return super.getStationMarkers();
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dtoUser: ${dtoUser},
user: ${user},
lastSessions: ${lastSessions},
nearby: ${nearby},
stationMarker: ${stationMarker},
getData: ${getData},
displayName: ${displayName}
    ''';
  }
}
