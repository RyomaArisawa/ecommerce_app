import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class FakeProductsRepository {
  FakeProductsRepository._();
  static FakeProductsRepository instance = FakeProductsRepository._();

  final List<Product> _products = kTestProducts;

  List<Product> getProductsList() {
    return _products;
  }

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProductsList() async {
    // Simulate network delay
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductsList() {
    // Simulate network delay
    return Stream.value(_products);
  }

  Stream<Product?> watchProduct(String id) {
    // Simulate network delay
    return watchProductsList().map((products) {
      return products.firstWhere((product) => product.id == id);
    });
  }
}
