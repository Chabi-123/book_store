import 'package:flutter/cupertino.dart';
import 'package:untitled1/data/book_list.dart';
import 'package:untitled1/model/address_class.dart';
import 'package:untitled1/model/book.dart';
import 'package:untitled1/model/book_mark_class.dart';
class ManageState with ChangeNotifier{
  /// for book buying
  int _counter = 0;

  set counter(int value){
    _counter=value;
    notifyListeners();
  }
  int get counter=>_counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  List<BookList> _cardProducts=[];

  bool addToCard(BookList product){
    if(!_cardProducts.contains(product)){
      _cardProducts.add(product);
      _counter++;
      notifyListeners();
      return true;
    }
    else{
      return false;
    }
  }

  List<BookList> get cardProducts=> _cardProducts;

  /// for bookmark
  int _bookmarkCounter = 0;

  set bookmarkCounter(int value){
    _bookmarkCounter=value;
    notifyListeners();
  }

  int get bookmarkCounter => _bookmarkCounter;
  void incrementBookmarkCounter() {
    _bookmarkCounter++;
    notifyListeners();
  }

  List<BookList> _cardBook=[];

  bool addToBookmark(BookList product) {
    if(!_cardBook.contains(product)){
      _cardBook.add(product);
      _bookmarkCounter++;
      product.Bookmarked = true;
      notifyListeners();
      return true;
    }
    else{
      _cardBook.remove(product);
      _bookmarkCounter--;
      product.Bookmarked = false;
      notifyListeners();
      return false;
    }
  }
  List<BookList> get cardBook=> _cardBook;


  /// increase of quantity in cart page
  void increaseQuantity(BookList product){
    product.quantity++;
    notifyListeners();
  }
/// decrease of quantity in cart page
  void decreaseQuantity(BookList product){
    if(product.quantity>0){
      product.quantity--;
      notifyListeners();
    }
  }

/// calculate total price
  double calculate(){
    double total=0;
    for(var product in _cardProducts){
      total+=product.price*product.quantity;
    }
    return total;
  }
/// remove of books or novels
  void deleteProducts(BookList product){
    _cardProducts.remove(product);
    product.quantity=0;
    _counter--;
    notifyListeners();
  }
/// remove of bookmark
  void deleteBook(BookList product){
    _cardBook.remove(product);
    bookmarkCounter--;
    product.Bookmarked=false;
    notifyListeners();
  }
/// delivery info of user
  List<AddressClass> _deliveryInfo = [];

  List<AddressClass> get deliveryInfo => _deliveryInfo;

  void addDeliveryInfo(String name, String address, String email,String phoneNo) {
    _deliveryInfo.add(
      AddressClass(
          name: name,
        email:email,
        address: address,
        phoneNo: phoneNo,
      ),
    );
  }
/// brought book
  Book? _selectedBook;

  Book? get selectedBook => _selectedBook;

  void setSelectedBook(Book book) {
    _selectedBook = book;
    notifyListeners();
  }

}
