class ApplicationController < ActionController::Base
    before_action :add_header_text
    def add_header_text
        @menu = Page.all 
    end
end
