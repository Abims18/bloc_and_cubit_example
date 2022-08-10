part of 'sample_cubit.dart';

abstract class SampleState {
  const SampleState();
  @override
  List<Object> get props => [];
}

class SampleInitial extends SampleState {

}
class ApiInitiated extends SampleState {
}
class ApiSuccess extends SampleState {
 final ResponseModel responseModel;
 ApiSuccess(this.responseModel);

}
class ApiFailed extends SampleState {
final String errorMsg;
ApiFailed(this.errorMsg);

}
