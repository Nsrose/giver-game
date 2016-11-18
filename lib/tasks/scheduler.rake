desc "Send Email for Expired Games"
task :expire_games => :environment do
    GivingGame.expire_games
end