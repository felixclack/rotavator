Factory.define :unavailability do |f|
  f.from "#{Time.now + 7.days}"
  f.to "#{Time.now + 14.days}"
  f.association :user
end
