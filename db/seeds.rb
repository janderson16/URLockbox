user = User.create!(
                   email: "user@mail.com",
                   password: "pass",
                   password_confirmation: "pass"
                   )
link_1 = user.links.create!(
                        title: "Google",
                        url: "https://www.google.com"
                        )
link_2 = user.links.create!(
                        title: "Github",
                        url: "https://github.com"
                        )
