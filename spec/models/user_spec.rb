require 'rails_helper'

RSpec.describe User, type: :model do

  describe "associations" do
    it { should have_many(:articles).dependent(:destroy) }
  end

  describe "validations" do
    subject { User.create(username: "Foo", email: "foobar@example.com") }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username).ignoring_case_sensitivity }
    it { should validate_length_of(:username).is_at_least(3).is_at_most(25) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_length_of(:email).is_at_most(50) }
  end

  describe "email format" do
    let!(:user) { build(:user) }
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end

    it "should be valid" do
      addresses = %w[user@example.com USER@EXAMPLE.COM]
      addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end

  it { should have_secure_password }
end