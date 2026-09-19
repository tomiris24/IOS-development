// HOMEWORK 3 — Digital E-Commerce Media Store

// abstract class — base for all media items
abstract class MediaItem {
  String id;
  String title;
  double price;

  MediaItem(this.id, this.title, this.price);

  // every subclass must write its own version
  String getDetails();
}

// mixin with download function
mixin Downloadable {
  void download(String title) {
    print("downloading \"$title\" ... done!");
  }
}

class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;

  Audiobook(String id, String title, double price, this.durationHours, this.narrator)
      : super(id, title, price);

  @override
  String getDetails() {
    return "[AUDIOBOOK] $id | $title | narrator: $narrator | $durationHours h | $price ₸";
  }
}

class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;

  EBook(String id, String title, double price, this.fileSizeMB, this.author)
      : super(id, title, price);

  @override
  String getDetails() {
    return "[EBOOK] $id | $title | author: $author | $fileSizeMB MB | $price ₸";
  }
}

class ShoppingCart {
  // private list of items
  List<MediaItem> _items = [];

  void addItem(MediaItem item) {
    _items.add(item);
  }

  // sum of prices + 12% tax
  double calculateTotalWithTax({double taxRate = 0.12}) {
    double sum = _items.fold(0.0, (total, item) => total + item.price);
    return sum + sum * taxRate;
  }

  // only items that are not more expensive than maxPrice
  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items.where((item) => item.price <= maxPrice).toList();
  }

  void printReceipt() {
    print("===== RECEIPT =====");
    for (MediaItem item in _items) {
      print(item.getDetails());
      // if item can be downloaded -> download it
      if (item is Downloadable) {
        (item as Downloadable).download(item.title);
      }
    }
    print("-------------------");
    print("TOTAL with 12% tax: ${calculateTotalWithTax()} ₸");
    print("");
  }
}

void main() {
  ShoppingCart cart = ShoppingCart();

  cart.addItem(Audiobook("A-1", "Atomic Habits", 5500, 5.5, "James Clear"));
  cart.addItem(EBook("E-1", "Clean Code", 8500, 12.4, "Robert Martin"));
  cart.addItem(Audiobook("A-2", "Rich Dad Poor Dad", 3900, 6.2, "Tim Wheeler"));
  cart.addItem(EBook("E-2", "Flutter in Action", 12000, 25.8, "Eric Windmill"));

  cart.printReceipt();

  // filter: items up to 6000 ₸
  print("ITEMS UP TO 6000 ₸:");
  List<MediaItem> cheap = cart.filterByMaxPrice(6000);
  for (MediaItem item in cheap) {
    print(item.getDetails());
  }

  print("\ntotal with tax again: ${cart.calculateTotalWithTax()} ₸");
  print("total with tax 20%: ${cart.calculateTotalWithTax(taxRate: 0.2)} ₸");
}
