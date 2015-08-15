class SessionsController < ApplicationController
  def create
    p '=================', request.env['omniauth.auth']
    render nothing: true
  end
end