import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/utility/file/file_operator.dart';
import '../../../models/setting_model.dart';
import '../../../models/user_session_model.dart';


abstract class IDatabaseManager {
  Future<void> start();

  Future<void> clear();
}

@immutable
class HiveDatabaseManager implements IDatabaseManager {
  final String _subDirectory = 'vb10';

  @override
  Future<void> start() async {
    await _open();
    initialOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.deleteFromDisk();
    await FileOperation.instance.removeSubDirectory(_subDirectory);
  }

  /// Open your database connection
  /// Now using [Hive]
  Future<void> _open() async {
    final subPath =
        await FileOperation.instance.createSubDirectory(_subDirectory);
    await Hive.initFlutter(subPath);
  }

  /// Register your generic model or make your operation before start
  void initialOperation() {
    Hive.registerAdapter(SettingModelAdapter());
    Hive.registerAdapter(UserSessionModelAdapter());
  }
}
