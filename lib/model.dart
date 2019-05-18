import 'package:scoped_model/scoped_model.dart';

class DonationModel extends Model{

  int _count = 0;
  bool _donateClicked = false;

  get count => _count;

  get donateClicked => _donateClicked;

  void increment(){
    _count++;
    notifyListeners();
  }

  void decrement(){
    _count--;
    notifyListeners();
  }


  set donateClicked(bool donate){
    if(donate == null){
      throw new ArgumentError();
    }

    _donateClicked = donate;
    notifyListeners();
  }

}