#wipes database every 12 hours for maintenance
every 12.hours do
   rake "cleaner:scrub"
end