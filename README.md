# DogSpotting

## DAY 1
### Create your Model

1. Fill out `DogModel` [struct](https://www.hackingwithswift.com/read/0/15/structs) (DogModel.swift)
    * Based on our Hi-Fi, which properties do we need?
    * What types will these properties have?
    * _Tip: Remember that this is just the definition of our struct, which is designed to hold the information about just 1 dog._
2. Create sample data
    * Create an array of dogs as a property of `DogSize`.
    * Use the [`static`](https://www.hackingwithswift.com/read/0/18/static-properties-and-methods) keyword on your property to make it belong to the type itself rather than instances.
    * You can use the "sampleDog" image in the assets folder or add your own dog images.
    * _Tip: Creating sample data is helpful when we want to preview our SwiftUI Views before we have full interactivity set up._
3. List `DogModel`'s sample data in ContentView
    * Replace string literals inside your [List](https://developer.apple.com/documentation/swiftui/list) with references to dog model properties.
    * _Tip: You'll need_ `DogModel` _to conform to the_ [`Identifiable`](https://www.hackingwithswift.com/books/ios-swiftui/working-with-identifiable-items-in-swiftui) _protocol to do this_
4. Define `DogSize` [enum](https://www.hackingwithswift.com/read/0/14/enumerations)
    * Fill out `DogSize` enum with relevant cases to represent the sizes of dogs available.
    * If you defined size as a String in your `DogModel`, go back into and use your enum instead.
5. Update the [`Picker`](https://developer.apple.com/documentation/swiftui/picker) in NewSpotView
    * Instead of tagging the picker with strings, use the enum cases as tags.
    * Udpdate the `selectedSize` property of NewSpotView to rely on the enum instead of a string.

## DAY 2
### Create your ViewModel

- Create @published var dogs: [DogModel]
- define the method addNewDog, and make sure you’re passing in the enum from AddSpotView
- change the dogs in List to reference vm.dogs
- define saveDogs()
- make dogsize, dogmodel codable
- define loadDogs()
- stretch: swipe to delete dogs

## DAY 3
### Access Protected Resources

- DogModel stores a UIImage instead of string imageName
- ContentView shows an image from a UIImage instead of based on a string name

## DAY 4
### Imprpove Accessibility

- Discuss different ways to provide voiceover labels - children combine, ignore, etc
- Choose your own accent color and ensure it has light, dark, high contrast versions

## DAY 5
### Implement Localization

- Localize all static text in the app (nav titles and buttons, date label, dog sizes)
