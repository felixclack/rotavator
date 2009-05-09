Factory.define :user do |f|
  f.login 'felix'
  f.email 'felixclack@gmail.com'
  f.first_name 'felix'
  f.surname 'clack'
  f.password 'secret'
  f.password_confirmation 'secret'
end