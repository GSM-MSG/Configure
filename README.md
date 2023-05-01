# Configure
Extended methods for fluent syntax in Swift

[Document](https://gsm-msg.github.io/Configure/documentation/configure/)

## Contents
- [Configure](#configure)
  - [Contents](#contents)
  - [Requirements](#requirements)
  - [Overview](#overview)
  - [Communication](#communication)
  - [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [Manually](#manually)
  - [Functionality](#functionality)
  - [Usage](#usage)
    - [`set(_:_:)`](#set__)
    - [`then(_:)`](#then_)
    - [`mutate(_:)`](#mutate_)
    - [`let(_:)`](#let_)
    - [`do(_:)`](#do_)

## Requirements
- Swift 5.0+
- iOS(.v11)+
- tvOS(.v11)+
- macOS(.v10_13)+
- watchOS(.v4)+

## Overview
Extended methods for fluent syntax in Swift

## Communication
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request.

## Installation
### Swift Package Manager
[Swift Package Manager](https://www.swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `Configure` into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/GSM-MSG/Configure.git", .upToNextMajor(from: "1.0.0"))
]
```

### Manually
If you prefer not to use either of the aforementioned dependency managers, you can integrate MSGLayout into your project manually.

## Functionality
- `.set` Sets the value of the property identified by the given key path.
- `.then` Executes the given closure with the object as its argument.
- `.mutate` Mutates the object with the given closure.
- `.let` Applies the given closure to the object and returns the result.
- `.do` Executes the given closure with the object as its argument.

## Usage

### `set(_:_:)`
Sets the value of a property using a key path.
```swift
let label = UILabel()
    .set(\.text, "Hello, world!")
    .set(\.textColor, .red)
```

### `then(_:)`
Executes a closure with the object as its argument.
```swift
let label = UILabel().then {
    $0.text = "Hello, world!"
    $0.textColor = .red
}
```

### `mutate(_:)`
Mutates the object with the given closure.
```swift
view.frame.mutate {
    $0.origin.x = 100
    $0.size.width = 150
}
```

### `let(_:)`
Applies the given closure to the object and returns the result.
```swift
let dateString = Date().let {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: $0)
}

```

### `do(_:)`
Executes the given closure with the object as its argument.
```swift
UserDefaults.standard.do {
    $0.set(42, forKey: "number")
    $0.set("hello", forKey: "string")
    $0.set(true, forKey: "bool")
}
```