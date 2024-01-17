

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginOrRegisterState{
  login,
  register
}

final loginOrRegisterProvider = StateProvider<LoginOrRegisterState>((ref) => LoginOrRegisterState.login);