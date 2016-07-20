require "rubyapp/init"

require "minitest/autorun"
require 'mocha/mini_test'
require "rack/test"

require "rubyapp"

class TestRubyApp < MiniTest::Unit::TestCase
	include Rack::Test::Methods
	
	def app
		Rubyapp.new
	end
	def test_post_message
		app.expects(:push).with("Hello!")
		post("/messages", meesage: "Hello!")
		assert_equal(204,response.status)
	end


	def test_post_message_missing
		app.expects(:push).never
		post("/messages")
		assert_equal(400,response.status)
	end

	def test_post_message_empty
		app.expects(:push).never
		post("/messages", message: "  ")
		assert_equal(400,response.status)
	end
	

	alias_method :request, :last_request
	alias_method :response, :last_response
end