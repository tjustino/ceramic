# frozen_string_literal: true

namespace :load do
  desc "Loads the seed data from db/seeds.rb"
  task :seed do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rails, "db:seed"
        end
      end
    end
  end
end
