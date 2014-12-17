require 'rails_helper'
require 'spec_helper'


RSpec.describe UserCountry, :type => :model do
   it "should have valid factory" do
       FactoryGirl.build(:UserCountry).should be_valid
   end

   it "should require a name" do
       FactoryGirl.build(:UserCountry, :name => "").should_not be_valid
   end

   it "should require a code" do
       FactoryGirl.build(:UserCountry, :code => "").should_not be_valid
   end

   it "should require a name" do
       FactoryGirl.build(:UserCountry, :name => "India").should be_valid
   end

   it "should require a code" do
       FactoryGirl.build(:UserCountry, :code => "IN").should be_valid
   end
end
