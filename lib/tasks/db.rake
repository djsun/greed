namespace "greed" do
  task :kill_db do
    rm "db/development.sqlite3"
    rm "db/test.sqlite3"
  end

  desc "Rebuild the dev and test databases from scratch"
  task :rebuild => ["greed:kill_db", "db:migrate", "db:test:clone_structure"]
end
