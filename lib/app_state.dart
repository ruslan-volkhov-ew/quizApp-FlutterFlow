import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('ff_userId') ?? _userId;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _completedQuestions = 0;
  int get completedQuestions => _completedQuestions;
  set completedQuestions(int _value) {
    _completedQuestions = _value;
  }

  int _score = 0;
  int get score => _score;
  set score(int _value) {
    _score = _value;
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String _value) {
    _userId = _value;
    prefs.setString('ff_userId', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
