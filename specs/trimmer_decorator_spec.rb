require_relative 'spec_helper'

describe TrimmerDecorator do
  before :each do
    @person = Person.new(12_345, 22, 'Maximiliusness')
    @capitalize_decorator = CapitalizeDecorator.new(@person)
    @trimmer_decorator = TrimmerDecorator.new(@capitalize_decorator)
  end

  describe '#new trimmer_decorator' do
    it 'Returns an instance of the TrimmerDecorator class' do
      expect(@trimmer_decorator).to be_an_instance_of(TrimmerDecorator)
    end
  end

  describe '#correct_name' do
    it 'Trims the given name to 10 characters' do
      expect(@trimmer_decorator.correct_name).to eq('Maximilius')
    end
  end
end
