
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_pet_app/cubit/pet_cubit.dart';
import 'package:com.example.simple_pet_app/screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Simple Pet App',
			home: BlocProvider(
				create: (context) => PetCubit(),
				child: HomeScreen(),
			),
		);
	}
}
