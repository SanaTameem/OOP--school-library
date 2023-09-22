require_relative 'spec_helper'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(12_345, 22, 'sana')
    @capitalize_decorator = CapitalizeDecorator.new(@person)
  end

  describe '#new capitalize_decorator' do
    it 'Returns an instance of the CapitalizeDecorator class' do
      expect(@capitalize_decorator).to be_an_instance_of(CapitalizeDecorator)
    end
  end

  describe '#correct_name' do
    it 'Returns a capitalized name' do
      expect(@capitalize_decorator.correct_name).to eq('Sana')
    end
  end
end
