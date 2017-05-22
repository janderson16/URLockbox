require 'rails_helper'

describe User do
  it "user can be created as an admin" do
    user = User.create(email: "dirk_diggler@boogie.com",
                       password: "boom",
                       password_confirmation: "boom"
                       )

    expect(user).to be_valid
  end

  it "user cannot be created with blank password" do
    user = User.create(email: "dirk_diggler@boogie.com",
                       password: ""
                       )

    expect(user).to_not be_valid
  end

  it "user cannot be created without matching password confirmation" do
    user = User.create(email: "dirk_diggler@boogie.com",
                       password: "boom",
                       password_confirmation: ""
                       )

    expect(user).to_not be_valid
  end
end
