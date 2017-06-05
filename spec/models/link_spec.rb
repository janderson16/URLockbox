require 'rails_helper'

describe Link do
  it "link can be created" do
    user = User.create(email: "dirk_diggler@boogie.com",
                       password: "boom",
                       password_confirmation: "boom"
                       )
    link = user.links.create(title: "Google",
                             url: "https://wwww.google.com"
                             )

    expect(link).to be_valid
  end

  it "link cannot be created with blank title" do
    user = User.create(email: "dirk_diggler@boogie.com",
                       password: "boom",
                       password_confirmation: "boom"
                       )
    link = user.links.create(title: "",
                             url: "https://wwww.google.com"
                             )

    expect(link).to_not be_valid
  end

  it "link cannot be created without valid URL" do
    user = User.create(email: "dirk_diggler@boogie.com",
                       password: "boom",
                       password_confirmation: "boom"
                       )
    link = user.links.create(title: "Google",
                             url: "google.com"
                             )

    expect(link).to_not be_valid
  end

  it "link can be edited" do
    user = User.create(email: "dirk_diggler@boogie.com",
                       password: "boom",
                       password_confirmation: "boom"
                       )
    link = user.links.create(title: "Google",
                             url: "https://wwww.google.com"
                             )
    link.update(title: "Github", url: "https://github.com/")

    expect(link).to be_valid
  end
end
