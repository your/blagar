require 'blagar/version'

require 'blagar/syncher/syncher'
require 'blagar/server/server'

module Blagar
  def self.serve
    Syncher.run and Server.listen
  end
end
