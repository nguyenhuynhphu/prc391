import 'dart:async';
import 'package:prc391/models/product/Product.dart';

abstract class BaseProduct {
  Stream<List<Product>> get productStream;
  Sink get productSink;
  bool searchProduct(name, items);
}

class ProductBloc implements BaseProduct {
  // streams of Color
  StreamController streamListController =
      StreamController<List<Product>>.broadcast();

  @override
  bool searchProduct(name, items) {
    List<Product> result = [];
    for (Product item in items) {
      if (item.name.toLowerCase().contains(name)) {
        result.add(item);
      }
    }
    productSink.add(result);
    return result != [];
  }

  //sink
  @override
  Sink get productSink => streamListController.sink;

  // stream
  @override
  Stream<List<Product>> get productStream => streamListController.stream;
}
