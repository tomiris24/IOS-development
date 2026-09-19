// LW3 — Library Book Management System

class Book {
  String title;
  String author;
  double price;
  bool isBorrowed;

  Book(this.title, this.author, this.price, {this.isBorrowed = false});
}

class Library {
  // private list of books
  List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
    print("added: ${book.title}");
  }

  // only books that are NOT borrowed
  List<Book> getAvailableBooks() {
    return _books.where((book) => book.isBorrowed == false).toList();
  }

  // sum of all prices
  double getTotalValue() {
    return _books.fold(0.0, (sum, book) => sum + book.price);
  }
}

void main() {
  Library library = Library();

  print("ADDING BOOKS:");
  library.addBook(Book("Clean Code", "Robert Martin", 8500));
  library.addBook(Book("Harry Potter", "J.K. Rowling", 6200, isBorrowed: true));
  library.addBook(Book("Flutter in Action", "Eric Windmill", 12000));
  library.addBook(Book("1984", "George Orwell", 4300, isBorrowed: true));

  print("\nAVAILABLE BOOKS:");
  List<Book> available = library.getAvailableBooks();
  for (Book book in available) {
    print("${book.title} — ${book.author} — ${book.price} ₸");
  }
  print("available count: ${available.length}");

  print("\nTOTAL VALUE OF COLLECTION: ${library.getTotalValue()} ₸");
}
