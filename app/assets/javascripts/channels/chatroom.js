App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
  connected: function() {
 
  },
  disconnected: function() {},
  received: function(message) {
const messages = document.getElementById('message')
messages.innerHTML += message
  },
  speak: function(content,data_user) {
    return this.perform('speak',{message: content, user_id: data_user});
  }
});

document.addEventListener('DOMContentLoaded', function(){
const input = document.getElementById('chatInput')
const button = document.getElementById('button')
const data_user = input.getAttribute("data_user");
button.addEventListener('click', function(){
const content = input.value
//サーバー側に送る処理
App.chatroom.speak(content,data_user)
input.value=''
})
})

