import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final user = await authRepository.login(event.username, event.password);
        if (user != null) {
          yield LoginSuccess(user: user);
        } else {
          yield LoginFailure();
        }
      } catch (_) {
        yield LoginFailure();
      }
    }
  }
}