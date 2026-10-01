import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_order/domain/use_cases/order_usecase.dart';
import 'package:firebase_app/features/feature_order/presentation/state/order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersCubit extends Cubit<OrderState> {

  final OrderUsecase _orderUsecase;
  OrdersCubit(this._orderUsecase) : super(GetOrderIdle());

  Future<void> getOrders() async {
    emit(GetOrderLoading());
    final result = await _orderUsecase.getOrders();
    result.fold(
      (exception) => emit(GetOrderFailure(exception.toMessage())),
      (data) => emit(GetOrderSuccess(data)),
    );
  }
}
