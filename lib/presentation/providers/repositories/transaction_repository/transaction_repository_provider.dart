import 'package:dk_mov/data/firebase/firebase_transaction_repository.dart';
import 'package:dk_mov/data/repositories/transaction_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_repository_provider.g.dart';

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) =>
    FirebaseTransactionRepository();