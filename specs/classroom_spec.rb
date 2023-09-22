require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('A11-Physics')
  end

  describe '#new classroom' do
    it 'Returns an instance of the Classroom class' do
      expect(@classroom).to be_an_instance_of(Classroom)
    end
  end

  describe '#label' do
    it 'Returns label of the classroom correctly' do
      expect(@classroom.label).to eq('A11-Physics')
    end
  end

  describe '#students' do
    it 'Returns students of the classroom' do
      expect(@classroom.students).to eql []
    end
  end
end
