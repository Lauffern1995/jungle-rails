require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.new
    @product = Product.new
  end


  describe 'Validations' do

    it "validates name" do 
      
      @product.name = '' # invalid state
      @product.validate 
      expect(@product.errors[:name]).to include("can't be blank") # check for presence of error
      
      

      @product.name = 'NOAH' # valid state
      @product.validate 
      expect(@product.errors[:name]).to_not include("can't be blank") # check for absence of error
    end

    it "validates price" do 
      
      @product.price = '' # invalid state
      @product.validate 
      expect(@product.errors[:price]).to include("is not a number") # check for presence of error
      

      @product.price = 420 # valid state
      @product.validate 
      expect(@product.errors[:price]).to_not include("is not a number") # check for absence of error
    end

    it "validates quantity" do 
      
      @product.quantity = '' # invalid state
      @product.validate 
      expect(@product.errors[:quantity]).to include("can't be blank") # check for presence of error
      

      @product.quantity = 1 # valid state
      @product.validate 
      expect(@product.errors[:quantity]).to_not include("is not a number") # check for absence of error
    end

    it "validates category" do 
      
      @product.category = nil # invalid state
      @product.validate 
      expect(@product.errors[:category]).to include("can't be blank") # check for presence of error
      

      @product.category = @category # valid state
      @product.validate 
      expect(@product.errors[:category]).to_not include("can't be blank") # check for absence of error
    end
    
  end
  
end
   


