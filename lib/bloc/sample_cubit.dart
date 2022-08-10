import 'package:bloc/bloc.dart';
import 'package:bloc_sample/model/response_model.dart';
import 'package:bloc_sample/provider/sample_provider.dart';
import 'package:equatable/equatable.dart';

part 'sample_state.dart';

class SampleCubit extends Cubit<SampleState> {
  SampleCubit() : super(SampleInitial());



Future<void> sampleApicalling()
  async {
emit(ApiInitiated());
SampleProvider sampleProvider = SampleProvider();
ResponseModel responseModel =await sampleProvider.fetchData();
if(responseModel.data!=null) {
  emit(ApiSuccess(responseModel));
} else
  {
    emit(ApiFailed("Something went wrong"));
  }
  }
}
