import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prepare_project/core/errors/failure_dio.dart';
import 'package:prepare_project/core/utilities/constant_var/constant.dart';
import 'package:prepare_project/core/utilities/network/crud_dio.dart';
import 'package:prepare_project/features/tourist/trip_history/data/model/trip_manager_model.dart';
import 'package:prepare_project/features/tourist/trip_history/data/repos/trip_manager_repo.dart';

class TripManagerRepoImpl implements TripManagerRepo{
  final ApiServices apiServices;
  TripManagerRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, TripManagerModel>> getAllTripsManager() async{
    try{
      var result =await apiServices.get(endPoint: '${homeEndPointTourist}tripHistory/tripManager');
      return right(TripManagerModel.fromJson(result));
    }

    catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> delete(Map<String,dynamic>data)async {
    try{
      var result =await apiServices.delete(endPoint: '${homeEndPointTourist}tripHistory/tripManager',data: data);
      return right(result['message']);
    }

    catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure,String>> repeatTripsManager(Map<String, dynamic> data)async {
    try{
      var result =await apiServices.patch(endPoint: '${homeEndPointTourist}tripHistory/tripManager',data: data);
      return right(result['message']);
    }

    catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  
}