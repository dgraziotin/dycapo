from models import Book, Author

from rpc4django import rpcmethod

@rpcmethod(name='add', signature=['float','float','float'])
def add(first, second):
	return first+second
@rpcmethod(name='new_book', signature=['boolean', 'Book'])
def new_book(new_book,author):
	book = Book()
	for name in book.__dict__:
		book[name] = new_book[name]
		book.save()

@rpcmethod(name='new_author', signature=['boolean', 'author'])    
def new_author(author):
	return author;
