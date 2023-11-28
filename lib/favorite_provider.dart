import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'content.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Content> _favorites = [];
  List<Content> get favorites => _favorites;

  void toggleFavoite(Content content) {
    if (_favorites.contains(content)) {
      _favorites.remove(content);
    } else {
      _favorites.add(content);
    }
    notifyListeners();
  }

  bool isExist(Content content) {
    final isExist = _favorites.contains(content);
    return isExist;
  }

  static FavoriteProvider of (
      BuildContext context, {
        bool listen = true,
      }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}