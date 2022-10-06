import 'package:airplane/UI/Widgets/transactionCard.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.length == 0) {
            return Center(
              child: Text('Belum ada transaksi'),
            );
          } else {
            return Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 100),
              child: ListView.builder(
                  itemCount: state.transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionCard(state.transactions[index]);
                  }),
            );
          }
        }
        print(state);
        return Center(child: Text('TRANSACTION PAGE'));
      }),
    );
  }
}
