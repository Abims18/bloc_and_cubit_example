
import 'package:bloc_sample/bloc/sample_cubit.dart';
import 'package:bloc_sample/model/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
class SampleUiTwo extends StatefulWidget {
  const SampleUiTwo({Key? key}) : super(key: key);

  @override
  _SampleUiTwoState createState() => _SampleUiTwoState();
}

class _SampleUiTwoState extends State<SampleUiTwo> {

  @override
  Widget build(BuildContext context) {
    ApiSuccess response = (GetIt.I.get<SampleCubit>()).state as ApiSuccess;

    return Center(child: Container(child: Text("my name  ${response.responseModel.data!.firstName}"),));
  }
}
