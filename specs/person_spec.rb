require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(12_345, 22, 'Sana')
  end

  describe '#new person' do
    it 'Returns an object of the Person class' do
      expect(@person).to be_an_instance_of(Person)
    end
  end

  describe '#id' do
    it 'Returns the id of the person correctly' do
      expect(@person.id).to be(12_345)
    end
  end

  describe '#age' do
    it 'Returns the age of the person correctly' do
      expect(@person.age).to be(22)
    end
  end

  describe '#name' do
    it 'Returns the name of the person correctly' do
      expect(@person.name).to eql('Sana')
    end
  end

  describe '#parent_permission' do
    it 'Return true for the parent permission of person' do
      expect(@person.instance_variable_get(:@parent_permission)).to be_truthy
    end
  end
end
