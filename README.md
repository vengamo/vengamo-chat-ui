# Vengamo Chat UI

Vengamo Chat UI is a Flutter project that provides a user interface for a chat application. It offers a sleek and modern design, allowing users to engage in conversations and view chat messages in an intuitive way.

## Features

- Display chat messages in a conversation-like interface.
- Support for both light and dark themes.
- Dynamic background gradient and image options.
- Customizable chat bubble design.
- Integration with a backend messaging system (to be implemented separately).

## Screenshots

![Screenshot 1](screenshots/screenshot1.png)
![Screenshot 2](screenshots/screenshot2.png)

## Installation

1. Ensure that you have Flutter installed on your system. For installation instructions, refer to the [Flutter official documentation](https://flutter.dev/docs/get-started/install).

2. Clone this repository to your local machine:
   ```js
   git clone https://github.com/vengamo/vengamo-chat-ui.git
   ```
   
3.Change to the project directory:
    ```
    cd vengamo-chat-ui
    ```

4.Fetch the project dependencies:
    ```
    flutter pub get
    ```

5.Run the app on a connected device or emulator:
    ```
    flutter pub get
    ```

This will start the Vengamo Chat UI app on your device.

## Customization

```js
const { Client } = require('whatsapp-web.js');

const client = new Client();

client.on('qr', (qr) => {
    // Generate and scan this code with your phone
    console.log('QR RECEIVED', qr);
});

client.on('ready', () => {
    console.log('Client is ready!');
});

client.on('message', msg => {
    if (msg.body == '!ping') {
        msg.reply('pong');
    }
});

client.initialize();
```
