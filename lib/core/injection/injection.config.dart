// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_app/core/injection/module.dart' as _i609;
import 'package:firebase_app/core/session/data/data_source/session_datasource_repo.dart'
    as _i1029;
import 'package:firebase_app/core/session/data/data_source/session_datasource_repo_impl.dart'
    as _i905;
import 'package:firebase_app/core/session/data/repo/session_repo_impl.dart'
    as _i867;
import 'package:firebase_app/core/session/domain/repo/session_repo.dart'
    as _i843;
import 'package:firebase_app/core/session/domain/use_cases/update_name_usecase.dart'
    as _i408;
import 'package:firebase_app/core/session/domain/use_cases/user_changes_usecase.dart'
    as _i996;
import 'package:firebase_app/core/session/domain/use_cases/user_reolad_usecase.dart'
    as _i746;
import 'package:firebase_app/core/session/domain/use_cases/user_signout_usecase.dart'
    as _i197;
import 'package:firebase_app/core/session/presentation/cubit/display_name_cubit.dart'
    as _i627;
import 'package:firebase_app/core/session/presentation/cubit/session_cubit.dart'
    as _i405;
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
import 'package:firebase_app/features/feature_home/data/data_source/home_datasource_repo.dart'
    as _i397;
import 'package:firebase_app/features/feature_home/data/data_source/home_datasource_repo_impl.dart'
    as _i316;
import 'package:firebase_app/features/feature_home/data/repo/home_repo_impl.dart'
    as _i931;
import 'package:firebase_app/features/feature_home/domain/repo/home_repo.dart'
    as _i882;
import 'package:firebase_app/features/feature_home/domain/use_cases/home_data/home_data_usecase.dart'
    as _i473;
import 'package:firebase_app/features/feature_home/presentation/bloc/home_bloc.dart'
    as _i874;
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
    gh.lazySingleton<_i974.FirebaseFirestore>(() => module.firebaseFirestore);
    gh.lazySingleton<_i397.HomeDatasourceRepo>(
      () => _i316.HomeDatasourceRepoImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i882.HomeRepo>(
      () => _i931.HomeRepoImpl(gh<_i397.HomeDatasourceRepo>()),
    );
    gh.lazySingleton<_i594.AuthDatasourceRepo>(
      () => _i542.AuthDatasourceRepoImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i1029.SessionDatasourceRepo>(
      () => _i905.SessionDatasourceRepoImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i843.SessionRepo>(
      () => _i867.SessionRepoImpl(gh<_i1029.SessionDatasourceRepo>()),
    );
    gh.lazySingleton<_i408.UpdateNameUsecase>(
      () => _i408.UpdateNameUsecase(gh<_i843.SessionRepo>()),
    );
    gh.lazySingleton<_i996.UserChangesUsecase>(
      () => _i996.UserChangesUsecase(gh<_i843.SessionRepo>()),
    );
    gh.lazySingleton<_i746.UserReoladUsecase>(
      () => _i746.UserReoladUsecase(gh<_i843.SessionRepo>()),
    );
    gh.lazySingleton<_i197.UserSignoutUsecase>(
      () => _i197.UserSignoutUsecase(gh<_i843.SessionRepo>()),
    );
    gh.lazySingleton<_i473.HomeDataUsecase>(
      () => _i473.HomeDataUsecase(gh<_i882.HomeRepo>()),
    );
    gh.lazySingleton<_i899.AuthRepo>(
      () => _i712.AuthRepoImpl(gh<_i594.AuthDatasourceRepo>()),
    );
    gh.factory<_i874.HomeBloc>(
      () => _i874.HomeBloc(gh<_i473.HomeDataUsecase>()),
    );
    gh.factory<_i627.DisplayNameCubit>(
      () => _i627.DisplayNameCubit(gh<_i408.UpdateNameUsecase>()),
    );
    gh.lazySingleton<_i943.SendSmsCodeUsecase>(
      () => _i943.SendSmsCodeUsecase(gh<_i899.AuthRepo>()),
    );
    gh.lazySingleton<_i351.VerifyPhoneUsecase>(
      () => _i351.VerifyPhoneUsecase(gh<_i899.AuthRepo>()),
    );
    gh.factory<_i405.SessionCubit>(
      () => _i405.SessionCubit(
        gh<_i996.UserChangesUsecase>(),
        gh<_i746.UserReoladUsecase>(),
        gh<_i197.UserSignoutUsecase>(),
      ),
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
