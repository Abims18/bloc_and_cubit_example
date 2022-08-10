
import 'package:bloc_sample/bloc/sample_cubit.dart';
import 'package:bloc_sample/model/response_model.dart';
import 'package:bloc_sample/screen/sample_ui_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SampleUi extends StatefulWidget {
  const SampleUi({Key? key}) : super(key: key);

  @override
  _SampleUiState createState() => _SampleUiState();
}

class _SampleUiState extends State<SampleUi> {
  String response = "";
  String error = "";
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SampleCubit, SampleState>(
        bloc: GetIt.I.get<SampleCubit>(),
            builder: (context, state) {
             print("State--- ${state.runtimeType}");
              switch (state.runtimeType)
              {
                 case ApiInitiated:
                  return CircularProgressIndicator();
                case ApiSuccess:
                  ResponseModel response = (state as ApiSuccess).responseModel;

                  return Center(child: Container(child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (SampleUiTwo())
                          ),
                        );
                      },
                      child: Text(response.data!.firstName.toString())),));
                case ApiFailed:
                  String  errorMessage  = (state as ApiFailed).errorMsg;
                  return Container(child: Text(errorMessage),);
                default:
                  return Container(child: InkWell(
                      onTap: (){
                        SampleCubit s=   GetIt.I.get<SampleCubit>();
                        s.sampleApicalling();
                        // SampleCubit sampleCubit=SampleCubit();
                        // sampleCubit.sampleApicalling();
                      },
                      child: Center(child: Text("click me"))),);
              }

            }
      ),


    );
  }
}
