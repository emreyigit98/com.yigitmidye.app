// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_app/core/injection/module.dart' as _i609;
import 'package:firebase_app/features/feature_auth/data/data_source/auth_datasource_repo.dart'
    as _i594;
import 'package:firebase_app/features/feature_auth/data/data_source/auth_datasource_repo_impl.dart'
    as _i542;
import 'package:firebase_app/features/feature_auth/data/repo/auth_repo_impl.dart'
    as _i712;
import 'package:firebase_app/features/feature_auth/domain/repo/auth_repo.dart'
    as _i899;
import 'package:firebase_app/features/feature_auth/domain/use_cases/send_sms_code_usecase.dart'
    as _i943;
import 'package:firebase_app/features/feature_auth/domain/use_cases/verify_phone_usecase.dart'
    as _i351;
import 'package:firebase_app/features/feature_auth/presentation/bloc/auth_bloc.dart'
    as _i129;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final module = _$Module();
    gh.lazySingleton<_i59.FirebaseAuth>(() => module.firebaseAuth);
    gh.lazySingleton<_i594.AuthDatasourceRepo>(
      () => _i542.AuthDatasourceRepoImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i899.AuthRepo>(
      () => _i712.AuthRepoImpl(gh<_i594.AuthDatasourceRepo>()),
    );
    gh.lazySingleton<_i943.SendSmsCodeUsecase>(
      () => _i943.SendSmsCodeUsecase(gh<_i899.AuthRepo>()),
    );
    gh.lazySingleton<_i351.VerifyPhoneUsecase>(
      () => _i351.VerifyPhoneUsecase(gh<_i899.AuthRepo>()),
    );
    gh.factory<_i129.AuthBloc>(
      () => _i129.AuthBloc(
        gh<_i943.SendSmsCodeUsecase>(),
        gh<_i351.VerifyPhoneUsecase>(),
      ),
    );
    return this;
  }
}

class _$Module extends _i609.Module {}
