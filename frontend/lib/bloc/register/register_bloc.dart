import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_kominfo/data/models/response/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/services/auth_remote_service.dart';
import '../../data/models/request/register_request_model.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final result = await AuthRemoteService().register(event.model);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
