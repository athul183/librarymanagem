import 'dart:io';
class Book {
   String title;
  final String author;

  Book(this.title, this.author);

  @override
  String toString() {
    return '$title by $author';
  }
}
class Library {

  List<Book> books = [];
  void addBook(String title, String author) {
    final book = Book(title, author);
    books.add(book);
    print('Added: $book');

  }

  void removeBook(String title) 
  {
    final bookToRemove = books.firstWhere((book) => book.title == title);
    if (bookToRemove != null) {
      books.remove(bookToRemove);
      print('Removed: $bookToRemove');
    } else {
      print('Book not found: $title');
    }
  }

  void listBooks() {
    print('Books in the library:');
    for (var book in books) {
      print(book);
    }
  }

  void printauthor(String targetAuthor)
  {
    List<Book> booksByAuthor = books.where((book) => book.author == targetAuthor).toList();

  
  if (booksByAuthor.isNotEmpty) {
    print('Books by $targetAuthor:');
  
    booksByAuthor.forEach((book) {
      print('- ${book.title}');
    });
  } else {
    print('No books found for $targetAuthor.');
  }  
  }

  void update(String authorName)
  {
      for (var book in books) {
      if (book.author == authorName) {
      
      print("Enter the updated book name");
      String newTitle=stdin.readLineSync().toString();
       book.title = newTitle;
      print("Details updated for ${authorName}'s book: ${book.title}");
      return;
    }
  }
  print("Book with author $authorName not found.");
  }
}

void main() {
  final library = Library();

  while (true) {
    print('Library Management System');
    print('1. Add Book');
    print('2. Remove Book');
    print('3. List Books');
    print('4. Author books');
    print('5. Update Book');
    print('6. Exit');
    stdout.write('Enter your choice: ');
    var choice = int.tryParse(stdin.readLineSync().toString());

    if (choice == null) {
      print('Invalid choice. Please enter a valid number.');
      continue;
    }

    switch (choice) {
      case 1:
        stdout.write('Enter title: ');
        var title = stdin.readLineSync();
        stdout.write('Enter author: ');
        var author = stdin.readLineSync();
        library.addBook(title!, author!);
        break;
      case 2:
        stdout.write('Enter the title of the book to remove: ');
        var title = stdin.readLineSync();
        library.removeBook(title!);
        break;
      case 3:
        library.listBooks();
        break;
      case 4:
      print('Enter an author name: ');
      String targetAuthor = stdin.readLineSync().toString();
      library.printauthor(targetAuthor);
      break;
      case 5:
      print('Enter the author of the book');
      String author = stdin.readLineSync().toString();
      library.update(author);

      case 6:
        print('Goodbye!');
        exit(0);
        
      default:
        print('Invalid choice. Please enter a valid number.');
    }
  }
}
