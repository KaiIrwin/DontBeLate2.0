class ResultController < ApplicationController
  def new
    # これ deal.last だと前ユーザーの最後の人になるだろ。現状 log in 状態にある id の人のやつにしたい
    # @user = User.find(session["user_id]") これかも https://stackoverflow.com/questions/623379/rails-tracking-a-users-id hmmm なんかあかん
    # But to get this work you need to make a sessions thing for log in 
    @user = User.last
    @deal = Deal.last
  end
end

# [Logic]
# Slack API を利用して、覚悟時間までに Slack を開いていないと、罰金。(なんかこれ新たな routing が必要な気がする...) 
# And 覚悟時間までに開いてなかったら何も起こらない。 well, id like to have some kind of cool css effect lol 
# if the [time you opened slack] is after [覚悟時間 deal.time] => 覚悟金額 deal.money を罰金。And Stripe API かなんかでクレカ情報を抜き取る

