require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('It starts with us', 'Author1')
  end

  describe '#new book' do
    it 'Returns an object of the book class' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

  describe '#title' do
    it 'Returns Title of the book correctly' do
      expect(@book.title).to eql('It starts with us')
    end
  end

  describe '#author' do
    it 'Returns author of the book correctly' do
      expect(@book.author).to eql('Author1')
    end
  end
end
