# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  private
    def reject_create_order
      flash[:notice] = 'Ooops! 預購已經截止囉，直接去竹塹週買吧！'
      redirect_to root_path
      return
    end
end
