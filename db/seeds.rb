# frozen_string_literal: true

Static.pages.each_value { |page_value| Static.create(page: page_value) }
User.create(email: "admin@domain.tld", password: "p@ssw0rd!", is_admin: true)
