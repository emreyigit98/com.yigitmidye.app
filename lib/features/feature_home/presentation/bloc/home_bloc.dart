
import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_home/domain/use_cases/home_data/home_data_usecase.dart';
import 'package:firebase_app/features/feature_home/presentation/event/home_event.dart';
import 'package:firebase_app/features/feature_home/presentation/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent,HomeState> {

  final HomeDataUsecase _homeDataUsecase;
  HomeBloc(this._homeDataUsecase) : super(HomeState()) {
    on<GetHomeDataEvent>(_fetchHomeData);
    
    on<SelectedCategoryEvent>((event,emit) {
      emit(state.copyWith(initialCategory: event.category));
    });
  }

  Future<void> _fetchHomeData(GetHomeDataEvent event,Emitter<HomeState> emit) async {

    final result = await _homeDataUsecase.getHomeData();

    result.fold((error) => emit(state.copyWith(errorMessage: error.toMessage())), 
    (data) {
      emit(state.copyWith(
        categories: data.categories,
        products: data.products,
        initialCategory: data.initialCategory
      ));
    });
  }
}