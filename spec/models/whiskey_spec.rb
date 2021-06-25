require 'rails_helper'

RSpec.describe Whiskey, type: :model do
  it "should validate name" do
    whiskey = Whiskey.create
    expect(whiskey.errors[:name]).to_not be_empty
  end
   it "should validate age" do
    whiskey = Whiskey.create
    expect(whiskey.errors[:age]).to_not be_empty
  end
   it "should validate country" do
    whiskey = Whiskey.create
    expect(whiskey.errors[:country]).to_not be_empty
  end
   it "should validate notes" do
    whiskey = Whiskey.create
    expect(whiskey.errors[:notes]).to_not be_empty
  end 
end
