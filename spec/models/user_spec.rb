require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new
    @user1 = User.new(
      name: "Noah",
      email: "noah.lauffer@test.com",
      password: "password",
      password_confirmation: "password"
      )
  end

  describe "Validations" do 

    it "validates" do 
      expect(@user1).to be_valid
    end

    it "validates name" do 
      @user.name = '' # invalid state
      @user.validate 
      expect(@user.errors[:name]).to include("can't be blank") # check for presence of error

      @user.name = 'NOAH' # valid state
      @user.validate 
      expect(@user.errors[:name]).to_not include("can't be blank") # check for absence of error

    end

    it "validates email" do 
      @user1.save
      @user.email = 'noah.lauffer@test.COM' # invalid state
      @user.validate 
  
      expect(@user.errors[:email]).to include("has already been taken") # check for presence of error

    end

    it "validates password matching" do 
      
      @user.password = 'password'
      @user.password_confirmation = 'passwordz' # invalid state
      @user.validate 
    
        
      expect(@user.password).to_not eq(@user.password_confirmation)
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")

      @user.password = 'password'
      @user.password_confirmation = 'password' # invalid state
      @user.validate 
  
      expect(@user.password).to eq(@user.password_confirmation)

    end

    it "validates passwords are populated " do 
      
      @user.password = 'password'
      @user.password_confirmation = nil # invalid state
      @user.validate 
    
    
      expect(@user.errors[:password_confirmation]).to include("can't be blank")

      @user.password = nil
      @user.password_confirmation = 'password' # invalid state
      @user.validate 
    

      expect(@user.errors[:password]).to include("can't be blank")

    end

    it "validates passwords long enough " do 
      
      @user.password = 'pas'
      @user.password_confirmation = 'pas' # invalid state
      @user.validate     
    
      expect(@user.errors[:password]).to include("is too short (minimum is 4 characters)")
      expect(@user.errors[:password_confirmation]).to include("is too short (minimum is 4 characters)")

    end
  
  end 


  describe '.authenticate_with_credentials' do
    
    
    it "returns user if email and pass are correct" do
      user = User.create!(
        name: "Noah",
        email: "noah.lauffer@test.com",
        password: "password",
        password_confirmation: "password"
        )
      user_test = User.authenticate_with_credentials("noah.lauffer@test.com",'password') 
    
      expect(user_test).to eq(user)
    end

    it "returns user if email is cased incorrectly " do
      user = User.create!(
        name: "Noah",
        email: "noah.lauffer@test.com",
        password: "password",
        password_confirmation: "password"
        )
      user_test = User.authenticate_with_credentials("noah.LaUfFer@tEst.COm",'password') 
    
      expect(user_test).to eq(user)
    end

    it "returns user if email is spaced incorrectly " do
      user = User.create!(
        name: "Noah",
        email: "noah.lauffer@test.com",
        password: "password",
        password_confirmation: "password"
        )
      user_test = User.authenticate_with_credentials("  noah.lauffer@test.com    ",'password') 
    
      expect(user_test).to eq(user)
    end

    it "returns nil if no email and pass" do
      @test = User.authenticate_with_credentials(nil, nil)
      expect(@test).to eq(nil)
    end


  end


end
