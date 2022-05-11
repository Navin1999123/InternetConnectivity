import 'package:example/bloc/internet_bloc.dart';
import 'package:example/bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetStete>(
              listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Internet Connected!'),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Internet Not Connected'),
                backgroundColor: Colors.red,
              ));
            }
          }, builder: (context, state) {
            if (state is InternetGainedState) {
              return Text("connected");
            } else if (state is InternetLostState) {
              return Text("not Connected");
            } else {
              return Text('Loading...');
            }
          }),
        ),
      ),
    );
  }
}
