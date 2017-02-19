# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

#{msg.message.user.name}
cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 0 9 * * 1-7', () => #runs everyday 9:00am
    robot.send {room: "#general"}, "おはっす", null, true, "Asia/Hanoi"
    cron.start()

  robot.hear /.*(お願いします|お願い|おねがいします|おねがい|下さい|ください).*/, (msg) ->
    replies = [
        "#{msg.message.user.name}あ、いいっすよ",
        "#{msg.message.user.name}あ、全然いいっすよ",
        "いやおかしいでしょ(笑)",
        "ちょっと久保さん呼んできます。"
      ]
    msg.send msg.random replies

  robot.hear /.*(尾上).*/, (msg) ->
    msg.send "むっちゃいじられてる"

  robot.hear /.*(好き).*/, (msg) ->
    msg.send "#{msg.message.user.name}絶対思ってないでしょ(笑)"

  robot.respond /(.*)/i, (msg) ->
    ryuki_replies = [
      "あ、林さん、",
      "マジすか",
      "確かに",
      "ヤバイっすね",
      "ちょっと久保さん呼んできます。",
      "いや...ちょっと",
      "そっすね、",
      "行きましょう。"
    ]
    name = msg.message.user.name
    if name == "ayame"
      msg.send "長野さん、ほんまにうるさい"
    else if name == "ryuki"
      msg.send msg.random ryuki_replies
    else
      msg.send "うす、"
