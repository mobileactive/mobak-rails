module Mobak
  class Configuration
    attr_accessor :login, :password

    def initialize
      @login = ''
      @password = ''
    end
  end
end
