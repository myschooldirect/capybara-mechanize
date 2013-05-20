require 'capybara/mechanize/browser'

class Capybara::Mechanize::Driver < Capybara::RackTest::Driver
  
  def initialize(app, options = {})
    if Capybara.run_server && !app
      raise ArgumentError, "mechanize requires a rack application, but none was given"
    end
    @app = app
    @options = DEFAULT_OPTIONS.merge(options)
  end

  def remote?(url)
    browser.remote?(url)
  end
  
  def browser
    @browser ||= Capybara::Mechanize::Browser.new(self)
  end
  
end
