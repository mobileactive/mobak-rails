Mobile Active Ruby Gem Sender
=============================

[![Gem Version](https://badge.fury.io/rb/mobak.svg)](https://badge.fury.io/rb/mobak)

##Install gem:

```gem install mobak```


##Add configuration folder and file

```
config/initializers/mobak.rb
```

```
Mobak.configure do |config|
  config.login = YOUR_LOGIN
  config.password = YOUR_PASSWORD
end
```

##Sending message:

```
resp = Mobak::Sender.send_sms({:sender => 'Info', :message => 'Test message', :phone => '79194830xxx', :uid => 'UNIQUE_STRING_UID_FOR_YOUR_MESSAGE'})

puts resp
```