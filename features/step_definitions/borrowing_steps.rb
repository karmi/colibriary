Pokud /^existuje čtenář.. jménem "([^"]*)" s platným průkazem$/ do |name|
  Reader.create :name => name, :card_id => 123
end
