import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'content.dart';

class FinishedProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  final List<Content> _finished = [];
  List<Content> get finished => _finished;

  void toggleFinished(Content content) {
    if (_finished.contains(content)) {
      _finished.remove(content);
    } else {
      _finished.add(content);
    }
    notifyListeners();
  }

  bool isExist(Content content) {
    final isExist = _finished.contains(content);
    return isExist;
  }

  static FinishedProvider of (
      BuildContext context, {
        bool listen = true,
      }) {
    return Provider.of<FinishedProvider>(
      context,
      listen: listen,
    );
  }
}