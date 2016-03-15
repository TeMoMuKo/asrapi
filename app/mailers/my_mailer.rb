class MyMailer < Devise::Mailer
  default parts_order: [ "text/plain", "text/html" ]
end
