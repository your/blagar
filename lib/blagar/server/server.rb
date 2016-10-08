module Blagar
  module Server
    def self.listen
      lib_dir = `gem which blagar`.split('/')[0..-2].join('/')
      base_dir = `pwd`.chomp
      server_src = `cat #{lib_dir}/blagar/server/crystal/server.cr`.gsub(
        "BASE_DIR = \"\"",
        "BASE_DIR = \"#{base_dir}\""
      )
      server_src.gsub!("/store", "/compiled")
      exec("echo '#{server_src}' | crystal eval")
    end
  end
end
