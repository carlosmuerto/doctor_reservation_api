require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before(:each) do
    @user = User.create(name: 'Jane')

    @doctor = Doctor.new(
      user: @user,
      user_id: '1',
      name: 'Dr. John Doe',
      specialization: 'Pediatrics'
    )

    @doctor.photo.attach(
      io: File.open(Rails.root.join('spec', 'support', 'test_doc.jpg')),
      filename: 'soy.jpeg',
      content_type: 'image/jpeg'
    )

    @doctor.save
  end

  describe 'associations' do
    it 'should have many appointments' do
      assc = described_class.reflect_on_association(:appointments)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'is not valid without a name' do
      doctor = Doctor.new(name: nil)
      expect(doctor).to_not be_valid
    end

    it 'is not valid with a name less than 3 characters' do
      doctor = Doctor.new(name: 'ab')
      expect(doctor).to_not be_valid
    end

    it 'is not valid with a name more than 50 characters' do
      doctor = Doctor.new(name: 'a' * 51)
      expect(doctor).to_not be_valid
    end

    it 'is not valid without a specialization' do
      doctor = Doctor.new(specialization: nil)
      expect(doctor).to_not be_valid
    end

    it 'is not valid with a specialization less than 3 characters' do
      doctor = Doctor.new(specialization: 'ab')
      expect(doctor).to_not be_valid
    end

    it 'is not valid with a specialization more than 50 characters' do
      doctor = Doctor.new(specialization: 'a' * 51)
      expect(doctor).to_not be_valid
    end

    it 'is not valid without a photo' do
      doctor = Doctor.new(photo: nil)
      expect(doctor).to_not be_valid
    end
  end
end
