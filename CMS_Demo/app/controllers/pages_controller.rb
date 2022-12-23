class PagesController < ApplicationController
    def home
        @cms_page = Page.find_by_slug(params[:slug])
        # binding.pry
        # if (params[:slug]) === nil
        # else
        #     if @cms_page.blank?
        #         render :file => "#{Rails.root}/public/404.html", status: :not_found
        #     end
        # end
        unless (params[:slug]) === nil
            if @cms_page.blank?
                render :file => "#{Rails.root}/public/404.html", status: :not_found
            end
        end
    end
end
