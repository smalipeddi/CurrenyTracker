require 'rails_helper'
require 'spec_helper'


RSpec.describe UserCurrency, :type => :model do
   it "should have valid factory" do
       FactoryGirl.build(:UserCurrency).should be_valid
   end

   it "should require a name" do
       FactoryGirl.build(:UserCurrency, :name => "").should_not be_valid
   end

   it "should require a code" do
       FactoryGirl.build(:UserCurrency, :code => "").should_not be_valid
   end

   it "should require a name" do
       FactoryGirl.build(:UserCurrency, :name => "Dollar").should be_valid
   end

   it "should require a code" do
       FactoryGirl.build(:UserCurrency, :code => "AUD").should be_valid
   end

end
