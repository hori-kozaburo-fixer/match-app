import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    debugger;
    const fromName = `<p>${data.from_user}</p>`
    const message = `<p class="d-flex justify-content-center shadow p-3 mb-5 bg-light rounded">${data.content.message}</p>`;
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', fromName);
    messages.insertAdjacentHTML('beforeend', message);
    const newMessage = document.getElementById('message_message');
    newMessage.value='';
    debugger;
  }
});
