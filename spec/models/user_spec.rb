require 'rails_helper'

RSpec.describe User, type: :model do
  context 'relationships' do
    it "has many links" do
      user = User.new(email: "test@test.com", password: BCrypt::Password.create("test"))

      expect(user).to respond_to(:links)
    end
  end
  context 'validations' do
    it "has unique email" do
      User.create(email: "test@test.com", password: BCrypt::Password.create("test"))
      user = User.new(email: "test@test.com", password: BCrypt::Password.create("test"))

      expect(user).to be_invalid
    end
    it "has an email" do
      user = User.new(password: BCrypt::Password.create("test"))

      expect(user).to be_invalid
    end
  end
end
