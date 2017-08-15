# SwiftUIDebugSwiftyBeaver

[![CI Status](http://img.shields.io/travis/eberl_ma@gmx.at/SwiftUIDebugSwiftyBeaver.svg?style=flat)](https://travis-ci.org/eberl_ma@gmx.at/SwiftUIDebugSwiftyBeaver)
[![Version](https://img.shields.io/cocoapods/v/SwiftUIDebugSwiftyBeaver.svg?style=flat)](http://cocoapods.org/pods/SwiftUIDebugSwiftyBeaver)
[![License](https://img.shields.io/cocoapods/l/SwiftUIDebugSwiftyBeaver.svg?style=flat)](http://cocoapods.org/pods/SwiftUIDebugSwiftyBeaver)
[![Platform](https://img.shields.io/cocoapods/p/SwiftUIDebugSwiftyBeaver.svg?style=flat)](http://cocoapods.org/pods/SwiftUIDebugSwiftyBeaver)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftUIDebugSwiftyBeaver is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftUIDebugSwiftyBeaver'
```

## Usage

Setup logger

```Swift
func setupLogger() {
    let log = SwiftyBeaver.self
    ..
    log.addDestination(SwiftyUIDegubDestination.shared)
}

```

Show logger

```Swift
override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
        SwiftUIDebug.debugController(with: self,
                                     viewModel: SwiftLogViewModel(provider: SwiftyUIDegubDestination.shared))
    }
}

```

Add some logs

```Swift
log.debug("Hello World")

```

## Author

Martin Eberl, eberl_ma@gmx.at

## License

SwiftUIDebugSwiftyBeaver is available under the MIT license. See the LICENSE file for more info.
