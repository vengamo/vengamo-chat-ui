<img width="437" alt="Capture d’écran 2023-06-09 à 11 24 39" src="https://github.com/vengamo/vengamo-chat-ui/assets/133201077/a0b69b4b-9e0b-4a98-a313-0951676ab98e">


Vengamo Chat UI is a Flutter project that combines the user interface elements of WhatsApp, Telegram, and Facebook Messenger in one place. It offers a seamless and intuitive chat experience inspired by these popular messaging applications.

## Features

- Familiar UI elements from WhatsApp, Telegram, and Facebook Messenger.
- Customizable themes to personalize the chat interface.
- Image file support
- Audio files support 

## What's coming next
- Video file Support

## Early Feature request
 
 - [Get in touch](https://vengamo.com)
 - Send us an email vengamosocial@gmail.com
 - [Send us a message on whatsApp](https://api.whatsapp.com/send/?phone=33753861046&text=I+would+like+to+inquire+something+&type=phone_number&app_absent=0)
 - [Send us a message on Skype](https://join.skype.com/invite/Fz78g1fENfop)


## Screen Shoot

![Untitled design (7)](https://github.com/vengamo/vengamo-chat-ui/assets/133201077/acad32b0-5c4d-476a-9759-688498d73ba2)


## VengamoChatUI Drop in Properties.

- [Read documentation](https://pub.dev/documentation/vengamo_chat_ui/latest/vengamo_chat_ui/VengamoChatUI-class.html)

## Examples

```bash
   VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              isSender: true,
              isNextMessageFromSameSender: false,
              time: getTime(),
              isAudio: true,
              audioSource: 'http://www.uscis.gov/files/nativedocuments/Track%2093.mp3',
              timeLabelColor: AppColors.iconColor,
              pointer: true,
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
            ),
   VengamoChatUI(
            senderBgColor: AppColors.softGreenColor,
            receiverBgColor: AppColors.white,
            isSender: true,
            isNextMessageFromSameSender: false,
            time: '10:00',
            timeLabelColor : AppColors.softBlackcolor,
            text: "Yolla ✋ Hey, guess what?",
            pointer: true, 
            ack: Icon(
                    Icons.check,
                    color: AppColors.iconColor, // You can customize the color here
                  size: 13, // You can customize the size here
            ),
          ),
        VengamoChatUI(
              senderBgColor: AppColors.softGreenColor,
              receiverBgColor: AppColors.white,
              timeLabelColor: AppColors.darkModeBackgroundColor,
              isSender: true,
              isNextMessageFromSameSender: false,
              imgUrl : 'https://wallpaperaccess.com/full/1248267.jpg',
              caption: "Why did the sun never want to join the galaxy's talent show? Because it didn't want to be a star performer, it preferred to shine solo",
              time: '07:05',
              pointer: true, 
              ack: Image.asset(
                'assets/images/seen.png',
                height: 12,
                width: 12,
              ),
   )
   ```

## Getting Started

To use Vengamo Chat UI in your Flutter project, follow these steps:

1. Ensure that you have Flutter installed on your system. For installation instructions, refer to the [Flutter official documentation](https://flutter.dev/docs/get-started/install).

2. Open your project's `pubspec.yaml` file.

3. Add the following dependency under the `dependencies` section:

   ```yaml
   dependencies:
     vengamo_chat_ui: ^1.2.5
   ```

   Replace `^1.2.5` with the desired version of Vengamo Chat UI.

4. Save the `pubspec.yaml` file.

5. Run the following command in your project's root directory:

   ```bash
   flutter pub get
   ```

6. Import Vengamo Chat UI in your Dart code:

   ```dart
   import 'package:vengamo_chat_ui/vengamo_chat_ui.dart';
   ```

7. You can now use Vengamo Chat UI components in your Flutter app.

## Project maintainer

<img src="https://github.com/vengamo/vengamo-chat-ui/assets/133201077/7030deee-4d00-4de9-83d0-e0e46800070b" alt="Profile Image" height="45" width="45">
 
.[Eric Weeb](https://github.com/vengamo)


## Contributions

Contributions to the Vengamo Chat UI project are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request. Please follow the project's code of conduct.

## License

The Vengamo Chat UI project is licensed under the [MIT License](LICENSE).

Feel free to use this README template as a starting point and add more details as needed to provide a comprehensive overview of your Vengamo Chat UI project.