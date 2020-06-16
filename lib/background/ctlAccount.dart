import 'package:flutter/material.dart';
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

  Set addMember(String name) {
    if (-1 == (_prefs.getInt(name) ?? -1)) {
      _prefs.setInt(name, 0);
      _memberSet = _prefs.getKeys();
    }
    else {
      AlertDialog(
        title: Text('This name has already been.'),
      );
    }
    return _memberSet;
  }

  void deleteMember(String name) {
    _memberSet = _prefs.getKeys();
    if (_memberSet.contains(name)) {
      _prefs.remove(name);
      _memberSet = _prefs.getKeys();
    }
    else{
      _prefs.clear();
    }
  }

  void renameMember(String oldName, String newName) {
    int value = _prefs.getInt(oldName);
    _prefs.remove(oldName);
    _prefs.setInt(newName, value);
  }



}