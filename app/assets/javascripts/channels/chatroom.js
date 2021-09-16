App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
  connected: function() {
 
  },
  disconnected: function() {},
  received: function(message,data_user,room_id) {


var messages = document.getElementById('message','user_id','room_id')
messages.innerHTML += message //これが原因
  },
  speak: function(content,data_user,room_id) {
    return this.perform('speak',{message: content, user_id: data_user, rooms:room_id});
  }
});

document.addEventListener('DOMContentLoaded', function(){
const input = document.getElementById('chatInput')
const button = document.getElementById('button')
const data_user = input.getAttribute("data_user");
const room_id= input.getAttribute("room_id");
button.addEventListener('click', function(){
const content = input.value
//サーバー側に送る処理
App.chatroom.speak(content,data_user,room_id)
input.value=''
})
})

