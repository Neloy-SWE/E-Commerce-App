import 'package:equatable/equatable.dart';

class GetListParameter extends Equatable {
  final String text;

  const GetListParameter({
    required this.text,
  });

  @override
  List<Object> get props => [text];
}
