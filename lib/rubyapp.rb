require "rubyapp/init"
require "sinatra/base"

class Rubyapp < Sinatra::Base
	post "/messages" do
		if params[:message].nil? ||
		/\A\s*\Z/ =~ params[:message]
			halt 400
		end
		Rubyapp.push(params[:message])
		201		
	end

	def self.push(message)
		#FIX: send a message
	end
end