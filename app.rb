require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require 'json'
require 'securerandom'

class App
  def initialize
    @people_handler = PeopleHandler.new
    @books_handler = BooksHandler.new
    @rentals_handler = RentalsHandler.new
    load_data
  end

  def run
    puts '------------------------------------------------------'
    puts 'Welcome to School Library App!'
    puts '------------------------------------------------------'
    display_menu
  end

  def display_menu
    loop do
      puts "\nPlease choose an option by entering a number:"
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Add a person'
      puts '4 - Add a book'
      puts '5 - Add a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      option = gets.chomp.to_i
      if option == 7
        sava_data
        puts 'Thank you for using this app!'
        break
      else
        choose_option(option)
      end
    end
  end

  def choose_option(option)
    case option
    when 1
      @books_handler.list_all_books
    when 2
      @people_handler.list_all_people
    when 3
      create_person
    when 4
      @books_handler.create_book
    when 5
      @rentals_handler.create_rental(@books_handler.instance_variable_get(:@books),
                                     @people_handler.instance_variable_get(:@people))
    when 6
      @rentals_handler.list_all_rentals
    else
      puts 'Invalid input, Please write an number from[1-7]'
    end
  end

  def create_person
    print 'Do you want to add a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i
    case type
    when 1
      @people_handler.create_student
    when 2
      @people_handler.create_teacher
    else
      puts 'Invalid option. Please enter a valid number: 1 or 2'
    end
  end

  # Methods for saving and loading data from JSON files
  def sava_data
    @books_handler.save_books
    @people_handler.save_people
    @rentals_handler.save_rentals
  end

  def load_data
    @books_handler.load_books
    @people_handler.load_people
    @rentals_handler.load_rentals
  end
end

class PeopleHandler
  def initialize
    @people = []
  end

  def list_all_people
    @people.each do |person|
      if person.instance_of?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, age: #{person.age}"
      elsif person.instance_of?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, age: #{person.age}"
      end
    end
  end

  def create_student
    id = SecureRandom.uuid
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    permission = gets.chomp.downcase == 'y'
    person = Student.new(id, age, permission, name)
    @people << person
    puts 'Person(student) created successfully'
  end

  def create_teacher
    id = SecureRandom.uuid
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    puts 'Specialization: '
    speci = gets.chomp
    person = Teacher.new(id, age, speci, name)
    @people << person
    puts 'Person(teacher) created successfully'
  end

  def save_people
    people_data = []
    @people.each do |person|
      if person.is_a?(Student)
        people_data << {
          'id' => person.id, 'type' => 'Student', 'age' => person.age,
          'parent_permission' => person.parent_permission, 'name' => person.name
        }
      elsif person.is_a?(Teacher)
        people_data << {
          'id' => person.id, 'type' => 'Teacher', 'age' => person.age,
          'specialization' => person.specialization, 'name' => person.name
        }
      end
    end
    File.write('data/people.json', JSON.generate(people_data))
  end

  def load_people
    if File.exist?('data/people.json')
      people_data = JSON.parse(File.read('data/people.json'))
      @people = people_data.map do |person_hash|
        if person_hash['type'] == 'Student'
          Student.new(person_hash['id'], person_hash['age'], person_hash['parent_permission'], person_hash['name'])
        elsif person_hash['type'] == 'Teacher'
          Teacher.new(person_hash['id'], person_hash['age'], person_hash['specialization'], person_hash['name'])
        end
      end
    else
      @people = []
    end
  end
end

class BooksHandler
  def initialize
    @books = []
  end

  def list_all_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def save_books
    File.open('data/books.json', 'w') do |file|
      books_data = @books.map do |book|
        {
          'title' => book.title,
          'author' => book.author
        }
      end
      file.write(JSON.generate(books_data))
    end
  end

  def load_books
    if File.exist?('data/books.json')
      book_data = JSON.parse(File.read('data/books.json'))
      @books = book_data.map { |book_hash| Book.new(book_hash['title'], book_hash['author']) }
    else
      @book = []
    end
  end
end

class RentalsHandler
  def initialize
    @rentals = []
  end

  def display_books(books)
    puts 'Select a book from the following list by number'
    books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def display_people(people)
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      if person.instance_of?(Student)
        puts "[Student] #{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.instance_of?(Teacher)
        puts "[Teacher] #{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_rental(books, people)
    display_books(books)
    book_index = gets.chomp.to_i
    display_people(people)
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental_data = {
      'date' => date, 'book_title' => books[book_index].title,
      'person_name' => people[person_index].name, 'person_id' => people[person_index].id
    }
    @rentals << rental_data
    puts 'Rental created successfully'
  end

  def list_all_rentals
    print 'ID of person: '
    person_id = gets.chomp
    puts 'Rentals: '
    @rentals.each do |rental|
      if rental['person_id'] == person_id
        puts "Date: #{rental['date']}, Book \"#{rental['book_title']}\" by #{rental['person_name']}"
      end
    end
  end

  def save_rentals
    File.write('data/rentals.json', JSON.generate(@rentals))
  end

  def load_rentals
    @rentals = if File.exist?('data/rentals.json')
                 JSON.parse(File.read('data/rentals.json'))
               else
                 []
               end
  end
end
