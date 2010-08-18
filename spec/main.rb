require 'ramaze'
require 'ramaze/spec/bacon'

require __DIR__('../app')

describe MainController do
    behaves_like :rack_test

    should 'show start page' do
        get('/').status.should == 200
        last_response['Content-Type'].should == 'text/html'
        # last_response.should =~ /This is a test to make sure we can use Heroku and Ramaze together. /
    end

    should 'show /page1' do
        get('/page1').status.should == 200
        last_response['Content-Type'].should == 'text/html'
        # last_response.should =~ /This is a test to make sure we can use links./
    end
end
