import 'package:canwinn_project/blocks/fetch_servicelist/fetch_service_list_states.dart';
import 'package:canwinn_project/blocks/fetch_servicelist/fetch_serviceslist_event.dart';
import 'package:canwinn_project/blocks/repository/fetch_service_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceListBloc extends Bloc<FetchServiceListEvent, FetchServiceListStates>{
  Repository repository = Repository();
  ServiceListBloc():super(FetchServiceListStates()){
   on<FetchServiceList> (fetchServiceList);
  }
  Future<void> fetchServiceList(FetchServiceList event, Emitter<FetchServiceListStates> emit) async{
    try{
      final value = await repository.getServiceList();
      emit(state.copyWith(fetchServiceListData: value));
      print("SerListData:----${value?.length}");
    }catch(ex){
 print("Error:---${ex.toString()}") ;   }

  }
}