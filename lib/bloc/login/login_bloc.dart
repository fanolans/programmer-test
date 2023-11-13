import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_kominfo/data/models/response/auth_response_model.dart';
import 'package:flutter_test_kominfo/data/services/auth_remote_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/request/login_request_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final result = await AuthRemoteService().login(event.model);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
