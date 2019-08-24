import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class LotteryModel{
  int _first,_second;
  String get getPickedNumber;
  int get getAmount;
  int _amount;
}

class TwoDigitModel extends LotteryModel{

  TwoDigitModel(int first,int second,int amount){
    this._first = first;
    this._second = second;
    this._amount = amount;
  }

  @override
  String get getPickedNumber{
    return '$_first$_second';
  }

  @override
  int get getAmount {
    return this._amount;
  }
}

class ThreeDigitModel extends LotteryModel{
  int _third;

  ThreeDigitModel(int first,int second,int third,int amount){
    this._first = first;
    this._second = second;
    this._third = third;
    this._amount = amount;
  }

  @override
  String get getPickedNumber{
    return '$_first$_second$_third';
  }

  @override
  int get getAmount {
    return this._amount;
  }
}

class FourDigitModel extends LotteryModel{
  int _third,_fourth;

  FourDigitModel(int first,int second,int third,int fourth,int amount){
    this._first = first;
    this._second = second;
    this._third = third;
    this._fourth = fourth;
    this._amount = amount;
  }

  @override
  String get getPickedNumber{
    return '$_first$_second$_third$_fourth';
  }

  @override
  int get getAmount {
    return this._amount;
  }
}

class PendingNotifier extends ChangeNotifier{
  List<LotteryModel> lotteries = [];

  void add(List<LotteryModel> lotteries){
    this.lotteries = lotteries;
    notifyListeners();
  }
}
