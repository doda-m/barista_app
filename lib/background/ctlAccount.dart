import 'package:shared_preferences/shared_preferences.dart';

class ControlMemberDatabase {
  final SharedPreferences _prefs;
  Set <String>_memberSet;

  ControlMemberDatabase(this._prefs):
        _memberSet = _prefs.getKeys();

  Set <String>readMemberSet() {
    _memberSet = _prefs.getKeys();
    return _memberSet;
  }

  int readCounter(String name) {
    return _prefs.getInt(name);
  }

  bool setCounter(String name, int value) {
    if (-1 == (_prefs.getInt(name) ?? -1)) {
      return false;
    }
    else {
      _prefs.setInt(name, value);
      return true;
    }
  }

  bool resetCounter() {
    _memberSet = _prefs.getKeys();
    _memberSet.forEach((element) {
      _prefs.setInt(element.toString(), 0);
    });
    return true;
  }

  bool addMember(String name) {
    if (-1 == (_prefs.getInt(name) ?? -1)) {
      _prefs.setInt(name, 0);
      _memberSet = _prefs.getKeys();
      return true;
    }
    else {
      return false;
    }
  }

  bool deleteMember(String name) {
    if (-1 == (_prefs.getInt(name) ?? -1)) {
      return false;
    }
    else{
      _prefs.remove(name);
      _memberSet = _prefs.getKeys();
      return true;
    }
  }

  bool renameMember(String oldName, String newName) {
    int value = (_prefs.getInt(oldName) ?? -1);
    if (-1 == value) {
      return false;
    }
    else {
      if (-1 == (_prefs.getInt(newName) ?? -1)) {
        _prefs.remove(oldName);
        _prefs.setInt(newName, value);
        _memberSet = _prefs.getKeys();
        return true;
      }
      else {
        return false;
      }
    }
  }
}