require "rubyapp/init"
require "sinatra/base"

class Rubyapp < Sinatra::Base
	set :root, File.expand_path("../..", __FILE__)

	get '/' do
		[200, {"content-type" => "text/html"}, 
			File.read("public/index.html")]
	end


	post "/messages" do
    	if params[:message].nil? ||
        	/\A\s*\Z/ =~ params[:message]
      		halt 400
    	end
    	Rubyapp.push(params[:message])
    	204
 	 end


	def self.push(message)
		#FIX: send a message
	end
end