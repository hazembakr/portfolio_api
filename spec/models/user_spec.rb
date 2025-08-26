require 'rails_helper'

RSpec.describe User, type: :model do

    describe "Validations" do 
        subject {build(:user)}

        context "Presence" do
            it { should validate_presence_of(:name) }
            it { should validate_presence_of(:email) }
            it { should validate_presence_of(:password_digest) }
            it { should validate_presence_of(:created_at) }
            it { should validate_presence_of(:updated_at) }
            it { should have_secure_password }
        end

        context "uniquness" do
            it {should validate_uniqueness_of(:email)}
        end

        context "password length" do
            it { should validate_length_of(:password).is_at_least(6) }
        end

    end  

  describe "has_secure_password Authentications" do
    let(:user) { create(:user) }

    it "authenticates with correct password" do
        expect(user.authenticate("password1234")).to eq(user)
    end
    
    it "authenticates with correct password" do
        expect(user.authenticate("wrongPassword")).to be_falsey
    end

  end

end