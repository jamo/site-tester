require 'rubygems'
require 'bundler'
Bundler.require(:default)

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = 'http://materiaali.mooc.fi'

module MyCapybaraTest
  class Test
    include Capybara::DSL
    def test_google
      visit('/')

      if page.has_content?("#nayttokoeOK")
        sleep 10
        click("#nayttokoeOK")
      end

      page.all('a').each do |a|
        p A: a[:src]

      end
    end
  end
end

t = MyCapybaraTest::Test.new
t.test_google
