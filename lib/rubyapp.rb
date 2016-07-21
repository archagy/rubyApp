require "rubyapp/init"
require "sinatra/base"
require "pusher"




Pusher.app_id = '228182',
Pusher.key = '34b7830c76670bb6edee',
Pusher.secret = '4fbe6e58bfae108d637f'


class Rubyapp < Sinatra::Base
	set :root, File.expand_path("../..", __FILE__)

	get '/' do
		erb :index
	end


	post "/messages" do
    	if params[:message].nil? ||
        	/\A\s*\Z/ =~ params[:message]
      		halt 400
      	else
	    	Rubyapp.push(params[:message])
	    	204
    	end
 	 end


	def self.push message
		#p Pusher
		#pusher.trigger('messages', 'message', {:message => message})

	end
end