# encoding: utf-8
namespace :dev do

  desc "Setup db. Drop, create, migrate, dev:seed"
  task :setup => :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:seed'].execute
  end

  desc "Setup seed data for development env."
  task :seed => :environment do
    #User
    @user = User.create!(name: "lab2023 User", email: "user@lab2023.com", password: "12341234", password_confirmation: "12341234")
    # Admin
    @admin = Admin.create!(name: "lab2023 Admin", email: "info@lab2023.com", password: "12341234", password_confirmation: "12341234")
    #contributor
    @admin = Contributor.create!(name: "lab2023 Contributor", email: "contributor@lab2023.com", password: "12341234")

  end
end