namespace :project do
  desc "TODO"
  task printer: :environment do
    puts Project.first.title
  end

end
