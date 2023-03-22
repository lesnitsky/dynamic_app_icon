# Dynamic App Icon

[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/dynamic_app_icon.svg?style=social&hash=20230321)](https://github.com/lesnitsky/dynamic_app_icon)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)

Set any widget as an app icon! (macOS only)

## Installation

```sh
flutter pub add dynamic_app_icons
```

## Example

```dart
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppIcon(
        icon: FlutterLogo(),
        child: Scaffold(
          body: Center(
            child: Text('Flutter logo is now your app icon!'),
          ),
        ),
      )
    );
  }
}
```

## Demo

https://user-images.githubusercontent.com/6261302/227051495-a683add8-8f5a-4bb3-a672-86f865122548.mov

---

Check out [example](https://github.com/lesnitsky/dynamic_app_icon/tree/main/example) for more details

[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/dynamic_app_icon.svg?style=social&hash=20230321)](https://github.com/lesnitsky/dynamic_app_icon)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)

## License

Copyright 2023 Andrei Lesnitsky

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
