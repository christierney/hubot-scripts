# Let hubot make a tough decision for you.
# 
# <a> or <b> - hubot will choose between a and b
#
# hubot your money or your life?
#
# is/can/are/will/should <text>? - hubot will answer yes or no
#
# hubot can you fly?

answers = [
  "Yes."
  "Yes!"
  "Um, yeah!"
  "Totally."
  "No."
  "Maybe."
  "Indeed."
  "Certainly!"
  "Of course!"
  "Of course not."
  "I guess."
  "NO"
  "HECK YEAH!"
  "Sure."
  "Not at all."
  "Yes, absolutely."
  "Nah."
  "Nope."
  "No way!"
  "No, no, NO!!"
  "Meh."
  "If you insist."
  "I don't think so."
  "Nooooo...."
  "/me nods"
  "/me shakes its head"
]

module.exports = (robot) ->

  # respond to 'a or b?' questions
  robot.respond /(.*) or ([^\?]*)/i, (msg) ->
    choices = [ msg.match[1], msg.match[2] ]
    a = msg.random choices
    decision = [
      "#{a}"
      "um, #{a}?"
      "...#{a}."
      "#{a}!"
      "#{a}, of course!"
      "#{a}, I guess"
      "I think #{a}"
      "#{a} for great justice!"
      "Not #{a}, that's for sure!"
      "...I'm not sure, actually. There are good arguments for both."
      "I choose #{a}!"
      "#{a}. It's super effective!"
      "#{a}. You really have to ask?"
      "Anything but #{a}."
    ]
    msg.send msg.random decision

  # respond to  yes or no questions
  robot.respond /(is|can|are|will|should|do|shall|would) .*\?/i, (msg) ->
    # try to stop the roles listener from picking up on the "is"
    msg.finish
    msg.send msg.random answers
