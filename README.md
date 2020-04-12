# ReusableViewExtensions

[![Version](https://img.shields.io/cocoapods/v/ReusableViewExtensions.svg?style=flat)](https://cocoapods.org/pods/ReusableViewExtensions)
[![License](https://img.shields.io/cocoapods/l/ReusableViewExtensions.svg?style=flat)](https://cocoapods.org/pods/ReusableViewExtensions)
[![Platform](https://img.shields.io/cocoapods/p/ReusableViewExtensions.svg?style=flat)](https://cocoapods.org/pods/ReusableViewExtensions)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Do You hate registering `UITableViewCell` by `String` identifier? Remembering all of them, some in Storyboards, some hidded somewhere in constants?

NO MORE! Use **ReusableViewExtensions**!

## Installation

### CocoaPods
ReusableViewExtensions is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ReusableViewExtensions'
```
### Carthage
ReusableViewExtensions is available through [Carthage](https://github.com/Carthage/Carthage). To install it, simply add the following line to your Cartfile:

```ruby
github "agruchala/ReusableViewExtensions"
```

## Requirements
* Swift 4.x

## Usage

If You have installed framework everything should work out of the box for Your `UITableViewCell`s and `UICollectionViewCell`s. To use it when You want to get cell in data source

* add `import ReusableViewExtensions` to source file
* use one of extension method from framework, thats it!

### Code snippet

Having cell:
```swift
class MyCell: UITableViewCell { }
```
You don't need to add any comformance to cells, extension works for all `UITableViewCell` and `UICollectionViewCell`.

#### Register it for table view
Use `func register(_ cellType: Reusable.Type)`
```swift
...
tableView.register(MyCell.self)
...
```
For cells with `xib` files use `func register(nibType: Reusable.Type, bundle: Bundle = .main)`

#### Dequeue when needed without casting, just use type!
Use `func dequeue<T: Reusable>(for indexPath: IndexPath) -> T`
```swift
//File header
import ReusableViewExtensions

//Your data source
...
let cell: MyCell = tableView.dequeue(for: indexPath)
...
```

Check ***Example*** to see how it works with `xib` and cell added from code :)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

My name is Artur, I'm developer from Poland:)

## License

ReusableViewExtensions is available under the MIT license. See the LICENSE file for more info.
