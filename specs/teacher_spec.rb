require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(34_567, 40, 'History', 'Tomas')
  end

  describe '#new teacher' do
    it 'Returns an instance of the Teacher class' do
      expect(@teacher).to be_an_instance_of(Teacher)
    end
  end

  describe '#id' do
    it 'Returns id of the teacher correctly' do
      expect(@teacher.id).to be(34_567)
    end
  end

  describe '#age' do
    it 'Returns age of the teacher correctly' do
      expect(@teacher.age).to be(40)
    end
  end

  describe '#specialization' do
    it 'Returns specialization of the teacher correctly' do
      expect(@teacher.specialization).to eql('History')
    end
  end

  describe '#name' do
    it 'Returns name of the teacher correctly' do
      expect(@teacher.name).to eql('Tomas')
    end
  end
end
