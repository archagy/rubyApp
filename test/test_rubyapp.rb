require "rubyapp/init"
require "minitest/autorun"
require "rack/test"
require "rubyapp"



class Pusher::Channel
	
	def self.triggers
		@triggers ||= []

	end 
	def trigger! event, data, *args
		self.class.triggers << [event, data]
	end
end

class TestRubyApp < MiniTest::Unit::TestCase
	include Rack::Test::Methods
	
	def setup
		Pusher::Channel.triggers.clear 
	end
	def app
		Rubyapp.new
	end
	def test_post_message
		post "/messages", message: "Hello!"
		puts response.status
		assert_equal 204, response.status
		assert_equal ["message", "Hello!"],
		 Pusher::Channel.triggers.first
	end


	def test_post_message_empty
		post("/messages", message: "  ")
		assert_equal(400,response.status)
		assert Pusher::Channel.triggers.empty?

	end

	def test_post_message_missing
		post("/messages")
		assert_equal(400,response.status)
		assert Pusher::Channel.triggers.empty?
	end

	

	alias_method :request, :last_request
	alias_method :response, :last_response
end