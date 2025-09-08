import 'package:canwinn_project/modules/service_list/fetch_service_list.dart';
import 'package:equatable/equatable.dart';

class FetchServiceListStates extends Equatable{
 final List<FetchServiceListData> fetch;
   FetchServiceListStates({this.fetch = const []});

  FetchServiceListStates copyWith({List<FetchServiceListData>? fetchServiceListData}){
   return FetchServiceListStates(
      fetch: fetchServiceListData ?? this.fetch
    );
  }



  List<Object?> get props => [FetchServiceListStates];

}

