class Author():
    pass

class Book():
    pass

author = Author()
author.name = "Name"
author.surname = "Surname"
author.age = 57

book = Book()
book.title = "Book Title"
book.num_pages = 23
book.author = author

from xmlrpclib import ServerProxy
s = ServerProxy('http://localhost:8000')
s._ServerProxy__verbose = True
result = s.new_book(book)
print result
