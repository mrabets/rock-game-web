import consumer from "./consumer"


// const element = document.getElementById("room-id")
// const room_id = element.getAttribute('data-room-id')

consumer.subscriptions.create({channel: "RoomChannel", room_id: 1},  {
  connected() {
    console.log("Connected with room id ")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // $(`#msg-${room_id}`).append('<div class="message"> ' + data.content + '</div>')

    console.log(data)

    const element = document.getElementById('user-id')
    const user_id = Number(element.getAttribute('data-user-id'))

    let html;

    if (user_id === data.move.user_id) {
      html = data.mine
    } else {
      html = data.theirs
    }

    const moveContainer = document.getElementById('moves')
    moveContainer.innerHTML = moveContainer.innerHTML + html
  }
});
