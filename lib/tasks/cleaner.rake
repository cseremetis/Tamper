namespace :cleaner do
  desc "TODO"
  
  #purges all abandoned sessions
  task scrub: :environment do
    if Game.all != nil
      Game.all.each do |g|
        g.destroy
      end
    end
  end

end
