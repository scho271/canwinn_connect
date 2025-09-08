import 'package:equatable/equatable.dart';

class FetchServiceListEvent extends Equatable{
  const FetchServiceListEvent();
  List<Object?> get props => [];
}

class FetchServiceList extends FetchServiceListEvent{}
class FetchServiceListLoading extends FetchServiceListEvent{}


