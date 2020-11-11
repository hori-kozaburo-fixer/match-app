import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.message}</p>`;
    // const from_user_image = `<p>${data.content.from_user}</p>`;
    // const to_user_image = `<p>${data.content.to_user}</p>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_message');
    // messages.insertAdjacentHTML('afterbegin', from_user_image);
    // messages.insertAdjacentHTML('afterbegin', to_user_image);
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
