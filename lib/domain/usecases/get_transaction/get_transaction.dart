import 'package:dk_mov/data/repositories/transaction_repository.dart';
import 'package:dk_mov/domain/entities/result.dart';
import 'package:dk_mov/domain/entities/transaction.dart';
import 'package:dk_mov/domain/usecases/get_transaction/get_transaction_param.dart';
import 'package:dk_mov/domain/usecases/usecase.dart';

class GetTransaction
    implements UseCase<Result<List<Transaction>>, GetTransactionParam> {
  final TransactionRepository _transactionRepository;

  GetTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionParam params) async {
    var transactionListResult =
        await _transactionRepository.getUserTransaction(uid: params.uid);

    return switch (transactionListResult) {
      Success(value: final transactionList) => Result.success(transactionList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
