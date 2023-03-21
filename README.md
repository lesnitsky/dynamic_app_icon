# Dynamic App Icon

[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/dynamic_app_icon.svg?style=social)](https://github.com/lesnitsky/dynamic_app_icon)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)

Set any widget as an app icon! (macOS only)

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

## License

MIT

[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/dynamic_app_icon.svg?style=social)](https://github.com/lesnitsky/dynamic_app_icon)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)
