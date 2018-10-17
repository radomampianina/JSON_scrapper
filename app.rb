require 'google_drive'
require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'json'

$:.unshift File.expand_path("./../lib", __FILE__)
require 'scrapper'
# extractraction villes et email
Ville_email.new.emails('val-d-oise')

# mamorona json
 hash_to_json = Ville_email.new.show_mail
 File.open("db/emails.JSON","w") do |f|
  f.write(hash_to_json.to_json)
 end

# https://docs.google.com/spreadsheets/d/1F24Jy-3xOmO4UxL6aK_CtswGxyTowbfS_Z8PbH8Srw0/edit#gid=0
  session = GoogleDrive::Session.from_config("config.json")
  ws = session.spreadsheet_by_key("1F24Jy-3xOmO4UxL6aK_CtswGxyTowbfS_Z8PbH8Srw0").worksheets[0]
 # envoi json vers spreadsheets
 fJson = File.open("db/emails.JSON","r")
 data = fJson.read
  fJson.close
 my_hash = JSON.parse(data)
 st = 1
 while my_hash.keys[st].is_a? String
   ws[st, 1] = my_hash.keys[st]
   ws[st, 2] = my_hash.values[st]
   st += 1
 end
 ws.save
# voir https://docs.google.com/spreadsheets/d/1F24Jy-3xOmO4UxL6aK_CtswGxyTowbfS_Z8PbH8Srw0/
