require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    #reate_table "users", force: :cascade do |t|
    #  t.string   "name"
    #  t.string   "email"
     # t.string   "password_digest"
     # t.datetime "created_at",      null: false
     # t.datetime "updated_at",      null: false
    describe 'Validations' do
     # validation tests/examples here
      it "validate existence password field" do
        user = User.new(name:"test_user", email:"test@gmail.com", password_confirmation: "123456")
        expect(user).to_not be_valid
      end
      it "validate existence of password_confirmation field" do
        user = User.new(name:"test_user", email:"test@gmail.com", password: "123456")
        expect(user).to_not be_valid
      end
      it "validate existence of email field" do
        user = User.new(name:"test_user", password: "123456", password_confirmation: "123456")
        expect(user).to_not be_valid
      end
      it "validate existence of name" do
        user = User.new(email: "test@gmail.com", password: "123456", password_confirmation: "123456")
        expect(user).to_not be_valid
      end
      it "validate email uniqueness" do
        user1 = User.create(name:"test_user", email: "test@gmail.com", password: "123456", password_confirmation: "123456")
        user2 = User.new(name:"test_user1", email: "TEST@gmail.com", password: "123456", password_confirmation: "123456")
        expect(user2).to_not be_valid
      end
    end
    describe 'Verity minimum password length' do
      it "Verity minimum password length" do
        user = User.new(name:"test_user", email: "test@gmail.com", password: "123", password_confirmation: "123")
        expect(user).to_not be_valid
      end
    end
    describe '.authenticate_with_credentials' do
      # examples for this class method here
      it "Verity valid login input, wrong password" do
        user_create = User.create(name:"test_user", email: "test@gmail.com", password: "123456", password_confirmation: "123456")
        user = User.authenticate_with_credentials("test@gmail.com", "123457")
        expect(user).to eq(false)
      end
      it "Verity valid login input, correct password" do
        user_create = User.create(name:"test_user", email: "test@gmail.com", password: "123456", password_confirmation: "123456")
        user = User.authenticate_with_credentials("test@gmail.com", "123456")
        expect(user.name).to eq("test_user")
      end
    end
  
  end
end

