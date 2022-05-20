import 'package:megatech/source/core/error.dart';
import 'package:megatech/source/core/failure.dart';
import 'package:megatech/source/data_source/local_data_source.dart';
import 'package:megatech/source/data_source/remote_data_source.dart';
import 'package:megatech/source/model/login_model.dart';
import 'package:megatech/source/model/session_model.dart';
import 'package:dartz/dartz.dart';
abstract class ISignedInRepository {
  const ISignedInRepository();
  Future<Either<Failure, SessionModel>> getSession();
  Future<Either<Failure, LoginModel>> getLogin(String name, String password);
}

class SignedInRepository extends ISignedInRepository {
  final IRemoteDataSource remoteDataSource;
  final ILocalDataSource localDataSource;

  const SignedInRepository(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, SessionModel>> getSession() async{
    try {
      final session = await localDataSource.getSession();
      print('session:::${session.id}');
      return Right(session);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, LoginModel>> getLogin(String name, String password)async {
    try {
      final loginModel = await remoteDataSource.getLogin(name, password);
      localDataSource.cacheSession(loginModel);
      return Right(loginModel);
    } on CacheException {
      return const Left(ServerFailure());
    }
  }
}
