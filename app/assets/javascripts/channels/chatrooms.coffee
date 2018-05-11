App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if active_chatroom.length > 0
      active_chatroom.append(data.message)
    else
    #
    messages_num = $("[data-chatroom-id='1'] #messages_num")
    if messages_num.length > 0
      count = parseInt(messages_num.text())
      count += 1
      messages_num.text(count)
    else

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, body: message}

  subscribed: ->
    @perform "subscribed"

  unsubscribed: ->
    @perform "unsubscribed"
