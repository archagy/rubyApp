require "rubyapp/init"
require "sinatra/base"
require "pusher"


unless "production" == ENV["RACK_ENV"]
	pusher_client = Pusher::Client.new(
  		app_id: '228182',
  		key: '34b7830c76670bb6edee',
  		secret: '4fbe6e58bfae108d637f'
	);	
end


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