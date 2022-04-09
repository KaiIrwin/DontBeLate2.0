class ResultController < ApplicationController
  def new
    # これ deal.last だと前ユーザーの最後の人になるだろ。現状 log in 状態にある id の人のやつにしたい
    # @user = User.find(session["user_id]") これかも https://stackoverflow.com/questions/623379/rails-tracking-a-users-id hmmm なんかあかん
    # But to get this work you need to make a sessions thing for log in 
    @user = User.last
    @deal = Deal.last

    # 覚悟時間のこと
    @DealTime = Deal.last.time

    # 覚悟金額のこと
    @DealMoney = Deal.last.money

    # Script to define the @UserPresence variable, which should repersent if the user is active or not on Slack
    @GetPresenceAPI = ` curl -X POST https://slack.com/api/users.getPresence --data "token=xoxp-2897666266758-2928076043648-3344163263027-ba326e51eb5f5df90f607ee37c483971&user=U02TA2819K2"`
    hash = JSON.parse(@GetPresenceAPI)
    @UserPresence = hash["presence"]

    @EarliestActiveTime = @DealTime - 300

    # @Result に関して
    # This variable is either "congrats!" or "@DealMoney をクレカから引き落としました" depending on wheather the user is active on slack until @DealTime.

    # ここで @Result の値を判定します

      if @EarliestActiveTime <= Time.now && Time.now <= @DealTime && @UserPresence = "active"
        @Result = 'Congrats'
      elsif Time.now < @DealTime
        @Result = '覚悟時間まで待ってください'
      else 
        @Result = '残念でした'
      end 
    end
  end

# [Logic] しかも覚悟時間になったらこれが表示される仕組みにしなきゃ
# Slack API を利用して、覚悟時間までに Slack を開いていないと、罰金。(なんかこれ新たな routing が必要な気がする...) 
# And 覚悟時間までに開いてなかったら何も起こらない。 well, id like to have some kind of cool css effect lol 
# if [@UserPresence = "active"] at [@DealTime] 何も起こらない。 Else => 覚悟金額 deal.money を罰金。And Stripe API かなんかでクレカ情報を抜き取る

# curl で presence を判定
# terminal で判定する : curl -X POST https://slack.com/api/users.getPresence --data "token=xoxp-2897666266758-2928076043648-3344163263027-ba326e51eb5f5df90f607ee37c483971&user=U02TA2819K2"
# ここまできた方法は https://stackoverflow.com/questions/26220446/how-do-i-get-a-users-online-status-via-the-slack-api and https://api.slack.com/apps/A02SHE4LHT7/oauth?success=1 and https://zenn.dev/kou_pg_0131/articles/slack-api-post-message

