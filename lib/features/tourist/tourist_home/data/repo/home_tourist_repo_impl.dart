import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prepare_project/core/utilities/constant_var/constant.dart';
import 'package:prepare_project/core/utilities/network/crud_dio.dart';
import 'package:prepare_project/features/tourist/tourist_home/data/repo/home_tourist_repo.dart';
import '../../../../../core/errors/failure_dio.dart';
class HomeTouristRepoImp implements HomeTouristRepo{
  final ApiServices apiServices;
  HomeTouristRepoImp(this.apiServices);
  @override
  Future<Either<Failure, String>> logOut() async{
    try{
      var result=await apiServices.post(endPoint: '${homeEndPoint}logout',);
      String response=result['message'];
      return right(response);
    }
    catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      else{
        return left(ServerFailure(e.toString()));
      }
    }

  }

}
