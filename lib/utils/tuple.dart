import 'package:equatable/equatable.dart';

//data structure used for storing anime titles
class Pair<A, B> extends Equatable {
  final A first;
  final B second;

  const Pair(this.first, this.second);

  @override
  List<Object?> get props => [first, second];
}

class Trio<A, B, C> extends Equatable {
  final A first;
  final B second;
  final C third;

  const Trio(this.first, this.second, this.third);

  @override
  List<Object?> get props => [first, second];
}
