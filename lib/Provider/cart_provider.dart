import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{
  int _counter = 0;
  int get counter =>_counter;

  double _totalPrice = 0;
  double get totalPrice =>_totalPrice;

  void _setCart () async {
    SharedPreferences addCart = await SharedPreferences.getInstance();
    addCart.setInt("cartItem", _counter);
    addCart.setDouble("totalPrice", _totalPrice);
    notifyListeners();
  }

  void _getCart () async{
    SharedPreferences addCart = await SharedPreferences.getInstance();
    _counter = addCart.getInt("cartItem") ?? 0;
    _totalPrice = addCart.getDouble("totalPrice") ?? 0.0;
    notifyListeners();
  }

  void addTotalPrice (double productPrice){
    _totalPrice = _totalPrice +productPrice ;
    _setCart();
    notifyListeners();
  }

  void removeTotalPrice (double productPrice){
    _totalPrice = _totalPrice  - productPrice ;
    _setCart();
    notifyListeners();
  }

  double getTotalPrice (){
    _getCart();
    return  _totalPrice ;
  }


  void addCounter (){
    _counter++;
    _setCart();
    notifyListeners();
  }

  void removerCounter (){
    _counter--;
    _setCart();
    notifyListeners();
  }

  int getCounter (){
    _getCart();
    return  _counter ;

  }
}