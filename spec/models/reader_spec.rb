require 'spec_helper'

describe Reader do

  it "is not valid without a name" do
    @reader = Reader.create :name => nil
    @reader.should_not be_valid
  end

end
