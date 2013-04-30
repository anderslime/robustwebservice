require 'spec_helper'

describe Customer do
  it "should validate presence of emails" do
    c = Customer.new(password: "mypas", password_confirmation: "mypas")
    c.should_not be_valid
  end

  it "should validate uniqueness of emails" do
    Customer.create(email: "my@email.dk", password: "mypas", password_confirmation: "mypas")
    c = Customer.new(email: "my@email.dk", password: "mypas", password_confirmation: "mypas")
    c.should_not be_valid
  end

  it "should check that password and password_confirmation is equal" do
    c = Customer.new(email: "my@email.dk", password: "foo", password_confirmation: "bar")
    c.should_not be_valid
  end
end
