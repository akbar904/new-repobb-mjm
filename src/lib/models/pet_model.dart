
import 'package:flutter/material.dart';

class Pet {
	final String name;
	final IconData icon;

	Pet({required this.name, required this.icon});

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;

		return other is Pet && other.name == name && other.icon == icon;
	}

	@override
	int get hashCode => name.hashCode ^ icon.hashCode;
}
