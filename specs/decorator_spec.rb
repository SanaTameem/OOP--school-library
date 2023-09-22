require_relative 'spec_helper'

describe Decorator do
  before :each do
    @decorator = Decorator.new('Sana')
  end

  describe '#new decorator' do
    it 'Returns an instance of Decorator class' do
      expect(@decorator).to be_an_instance_of(Decorator)
    end
  end
end
