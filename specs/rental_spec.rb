require_relative 'spec_helper'

describe Rental do
  before :each do
    @book = Book.new('It starts with us', 'Author1')
    @person = Person.new(34_589, 22, 'Sana')
    @rental = Rental.new('2023/08/19', @book, @person)
  end

  describe '#new rental' do
    it 'Returns an instance of the Rental class' do
      expect(@rental).to be_an_instance_of(Rental)
    end
  end

  describe '#date' do
    it 'Returns date of the rental correctly' do
      expect(@rental.date).to eql('2023/08/19')
    end
  end

  describe '@book' do
    it 'Returns book of the rental correctly' do
      expect(@rental.book).to be(@book)
    end
  end

  describe '@person' do
    it 'Returns person of the rental correctly' do
      expect(@rental.person).to be(@person)
    end
  end
end
