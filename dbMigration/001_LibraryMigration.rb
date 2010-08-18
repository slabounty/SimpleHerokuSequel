# Sequel migration that creates the books, authors, and authors_books.
Class.new(Sequel::Migration) do
    def up
        create_table(:books) do
            primary_key :id
            String :title 
        end

        create_table(:authors) do
            primary_key :id
            String :first_name 
            String :last_name
        end

        create_table(:authors_books) do
            primary_key :id
            foreign_key :author_id, :authors
            foreign_key :book_id, :books
        end

        # Create a few books and authors.
        book_id = from(:books).insert(:title => 'Programming Ruby')
        author_id = from(:authors).insert(:first_name => 'Dave', :last_name => 'Thomas')
        from(:authors_books).insert(:book_id => book_id, :author_id => author_id)

        book_id = from(:books).insert(:title => 'Metaprogramming Ruby')
        author_id = from(:authors).insert(:first_name => 'Paolo', :last_name => 'Perrota')
        from(:authors_books).insert(:book_id => book_id, :author_id => author_id)

        book_id = from(:books).insert(:title => 'Ruby Best Practices')
        author_id = from(:authors).insert(:first_name => 'Gregory', :last_name => 'Brown')
        from(:authors_books).insert(:book_id => book_id, :author_id => author_id)

        book_id = from(:books).insert(:title => 'The Ruby Way')
        author_id = from(:authors).insert(:first_name => 'Hal', :last_name => 'Fulton')
        from(:authors_books).insert(:book_id => book_id, :author_id => author_id)

        book_id = from(:books).insert(:title => 'The Pragmatic Programmer')
        author_id = from(:authors).insert(:first_name => 'Dave', :last_name => 'Thomas')
        from(:authors_books).insert(:book_id => book_id, :author_id => author_id)

    end

    def down
        drop_table(:books, :authors, :authors_books)
    end
end
