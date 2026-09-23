// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

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
import 'package:firebase_app/features/feature_adress/data/data_source/adress_datasource_repo.dart'
    as _i641;
import 'package:firebase_app/features/feature_adress/data/data_source/adress_datasource_repo_impl.dart'
    as _i325;
import 'package:firebase_app/features/feature_adress/data/repo/adress_repo_impl.dart'
    as _i965;
import 'package:firebase_app/features/feature_adress/domain/repo/adress_repo.dart'
    as _i780;
import 'package:firebase_app/features/feature_adress/domain/use_cases/delete_adress_usecase.dart'
    as _i711;
import 'package:firebase_app/features/feature_adress/domain/use_cases/get_adreses_usecase.dart'
    as _i53;
import 'package:firebase_app/features/feature_adress/domain/use_cases/save_adress_usecase.dart'
    as _i30;
import 'package:firebase_app/features/feature_adress/presentation/bloc/adress_bloc.dart'
    as _i146;
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
import 'package:firebase_app/features/feature_cart/data/data_source/cart_datasource_repo.dart'
    as _i926;
import 'package:firebase_app/features/feature_cart/data/data_source/cart_datasource_repo_impl.dart'
    as _i447;
import 'package:firebase_app/features/feature_cart/data/repo/cart_repo_impl.dart'
    as _i579;
import 'package:firebase_app/features/feature_cart/domain/repo/cart_repo.dart'
    as _i851;
import 'package:firebase_app/features/feature_cart/domain/use_cases/cart_count_usecase.dart'
    as _i496;
import 'package:firebase_app/features/feature_cart/domain/use_cases/delete_cart_item_usecase.dart'
    as _i655;
import 'package:firebase_app/features/feature_cart/domain/use_cases/get_cart_items_usecase.dart'
    as _i299;
import 'package:firebase_app/features/feature_cart/domain/use_cases/set_cart_item_usecase.dart'
    as _i465;
import 'package:firebase_app/features/feature_cart/presentation/bloc/cart_bloc.dart'
    as _i383;
import 'package:firebase_app/features/feature_cart/presentation/bloc/cart_count_cubit.dart'
    as _i572;
import 'package:firebase_app/features/feature_cart/presentation/bloc/set_cart_cubit.dart'
    as _i85;
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
    gh.lazySingleton<_i641.AdressDatasourceRepo>(
      () => _i325.AdressDatasourceRepoImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i780.AdressRepo>(
      () => _i965.AdressRepoImpl(gh<_i641.AdressDatasourceRepo>()),
    );
    gh.lazySingleton<_i926.CartDatasourceRepo>(
      () => _i447.CartDatasourceRepoImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i711.DeleteAdressUsecase>(
      () => _i711.DeleteAdressUsecase(gh<_i780.AdressRepo>()),
    );
    gh.lazySingleton<_i53.GetAdresesUsecase>(
      () => _i53.GetAdresesUsecase(gh<_i780.AdressRepo>()),
    );
    gh.lazySingleton<_i30.SaveAdressUsecase>(
      () => _i30.SaveAdressUsecase(gh<_i780.AdressRepo>()),
    );
    gh.lazySingleton<_i882.HomeRepo>(
      () => _i931.HomeRepoImpl(gh<_i397.HomeDatasourceRepo>()),
    );
    gh.lazySingleton<_i1029.SessionDatasourceRepo>(
      () => _i905.SessionDatasourceRepoImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i594.AuthDatasourceRepo>(
      () => _i542.AuthDatasourceRepoImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i843.SessionRepo>(
      () => _i867.SessionRepoImpl(gh<_i1029.SessionDatasourceRepo>()),
    );
    gh.lazySingleton<_i899.AuthRepo>(
      () => _i712.AuthRepoImpl(gh<_i594.AuthDatasourceRepo>()),
    );
    gh.lazySingleton<_i851.CartRepo>(
      () => _i579.CartRepoImpl(gh<_i926.CartDatasourceRepo>()),
    );
    gh.lazySingleton<_i943.SendSmsCodeUsecase>(
      () => _i943.SendSmsCodeUsecase(gh<_i899.AuthRepo>()),
    );
    gh.lazySingleton<_i351.VerifyPhoneUsecase>(
      () => _i351.VerifyPhoneUsecase(gh<_i899.AuthRepo>()),
    );
    gh.lazySingleton<_i473.HomeDataUsecase>(
      () => _i473.HomeDataUsecase(gh<_i882.HomeRepo>()),
    );
    gh.factory<_i146.AdressBloc>(
      () => _i146.AdressBloc(
        gh<_i30.SaveAdressUsecase>(),
        gh<_i53.GetAdresesUsecase>(),
        gh<_i711.DeleteAdressUsecase>(),
      ),
    );
    gh.factory<_i874.HomeBloc>(
      () => _i874.HomeBloc(gh<_i473.HomeDataUsecase>()),
    );
    gh.lazySingleton<_i496.CartCountUsecase>(
      () => _i496.CartCountUsecase(gh<_i851.CartRepo>()),
    );
    gh.lazySingleton<_i655.DeleteCartItemUsecase>(
      () => _i655.DeleteCartItemUsecase(gh<_i851.CartRepo>()),
    );
    gh.lazySingleton<_i299.GetCartItemsUsecase>(
      () => _i299.GetCartItemsUsecase(gh<_i851.CartRepo>()),
    );
    gh.lazySingleton<_i465.SetCartItemUsecase>(
      () => _i465.SetCartItemUsecase(gh<_i851.CartRepo>()),
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
    gh.factory<_i572.CartCountCubit>(
      () => _i572.CartCountCubit(gh<_i496.CartCountUsecase>()),
    );
    gh.factory<_i129.AuthBloc>(
      () => _i129.AuthBloc(
        gh<_i943.SendSmsCodeUsecase>(),
        gh<_i351.VerifyPhoneUsecase>(),
      ),
    );
    gh.factory<_i627.DisplayNameCubit>(
      () => _i627.DisplayNameCubit(gh<_i408.UpdateNameUsecase>()),
    );
    gh.factory<_i85.SetCartCubit>(
      () => _i85.SetCartCubit(gh<_i465.SetCartItemUsecase>()),
    );
    gh.factory<_i383.CartBloc>(
      () => _i383.CartBloc(
        gh<_i299.GetCartItemsUsecase>(),
        gh<_i465.SetCartItemUsecase>(),
        gh<_i655.DeleteCartItemUsecase>(),
        gh<_i53.GetAdresesUsecase>(),
      ),
    );
    gh.factory<_i405.SessionCubit>(
      () => _i405.SessionCubit(
        gh<_i996.UserChangesUsecase>(),
        gh<_i746.UserReoladUsecase>(),
        gh<_i197.UserSignoutUsecase>(),
      ),
    );
    return this;
  }
}

class _$Module extends _i609.Module {}
