import 'package:equatable/equatable.dart';

class Async<T> extends Equatable {
  final T? data;
  final String? errorMessage;
  final bool _successWithoutData;
  final bool? _loading;

  const Async._(
      this.data, this.errorMessage, this._successWithoutData, this._loading);

  bool get isLoading => _loading ?? false;

  bool get isSuccess =>
      (_successWithoutData || data != null) && (errorMessage == null);

  bool get isFailure => errorMessage != null;

  bool get isInitial => (data == null)
      && (errorMessage == null)
      && (_successWithoutData == false)
      && (_loading == null);

  const Async.loading() : this._(null, null, false, true);
  const Async.success(T data) : this._(data, null, false, false);
  const Async.successWithoutData() : this._(null, null, true, false);
  const Async.failure(String errorMessage)
      : this._(null, errorMessage, false, false);
  const Async.initial() : this._(null, null, false, null);

  @override
  List<Object?> get props =>
      [data, errorMessage, _successWithoutData, _loading];
}
