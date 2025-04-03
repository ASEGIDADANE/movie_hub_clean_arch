// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/common/bloc/generic_state.dart';
// import 'package:movie_app/core/usecase/usecase.dart';



// class GenericDataCubit extends Cubit<GenericDataState> {
//   GenericDataCubit() : super(DataLoading());


//   void getData<T>(UseCase usecase,{dynamic params}) async {
//     print('this is the params-----><--- $params');
//     var returnedData = await usecase.call(params);
//     print('this is returned data in recommandtion $returnedData');
//     returnedData.fold(
      
//       (error){
//         emit(
          
//           FailureLoadData(errorMessage: error)
//         );
//       },
//       (data){

//       print('data is loaded successfully $data');
       
//         emit(
//           DataLoaded<T>(data: data)
//         );
//       }
//     );
//   }
// }