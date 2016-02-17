module Mobak

  class Sender

    def self.send_sms(options={})

      uri = URI("http://client.mobak.ru/api/messages/xml")

      xml = '<?xml version="1.0" encoding="utf-8"?>'
      xml += '<request uid="{uid}" sender="{sender}">'
      xml += '<security><login value="{login}"/><sign value="{signature}" /></security>'
      xml += '<message><text>{message}</text><abonent phone="{phone}"/></message></request>'

      md5 = Digest::MD5.new
      md5.update options[:uid] + config.password
      h = md5.hexdigest

      xml = xml.sub('{uid}', options[:uid])
      xml = xml.sub('{login}', config.login)
      xml = xml.sub('{signature}', h)
      xml = xml.sub('{sender}', options[:sender])
      xml = xml.sub('{message}', options[:message])
      xml = xml.sub('{phone}', options[:phone])

      # puts xml

      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Post.new uri
        request.set_form_data('xml' => xml)

        response = http.request request

        response.body
      end

    end

    private

    def self.config
      Mobak.configuration
    end

  end

end