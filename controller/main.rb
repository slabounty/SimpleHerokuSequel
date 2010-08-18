# Default url mappings are:
#  a controller called Main is mapped on the root of the site: /
#  a controller called Something is mapped on: /something
# If you want to override this, add a line like this inside the class
#  map '/otherurl'
# this will force the controller to be mounted on: /otherurl

class MainController < Controller
    map '/'

    # the index action is called automatically when no other action is specified
    def index
        @title = "Welcome to Ramaze and Heroku!"

        # Get all of the books from the Book model and order them
        # in alphabetical order.
        @books = Book.select.order(:title).all
    end

    def author_page
        @title = "Welcome to Page 1!"

        @authors = Author.select.order(:last_name).all
    end
end
