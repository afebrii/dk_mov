import 'package:dk_mov/domain/usecases/create_transaction/create_transaction.dart';
import 'package:dk_mov/presentation/providers/repositories/transaction_repository/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_transaction_provider.g.dart';

@riverpod
CreateTransaction createTransaction(CreateTransactionRef ref) => CreateTransaction(transactionRepository: ref.watch(transactionRepositoryProvider));