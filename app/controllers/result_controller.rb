class ResultController < ApplicationController
  def new
    # これ deal.last だと前ユーザーの最後の人になるだろ。現状 log in 状態にある id の人のやつにしたい
    # @user = User.find(session["user_id]") これかも https://stackoverflow.com/questions/623379/rails-tracking-a-users-id hmmm なんかあかん
    # But to get this work you need to make a sessions thing for log in 
    @user = User.last
    @deal = Deal.last
  end
end
