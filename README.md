# DogSpotting

## DAY 1
### Create your Model

1. Fill out `DogModel` [struct](https://www.hackingwithswift.com/read/0/15/structs) (DogModel.swift)
    * Based on our Hi-Fi, which properties do we need?
    * What types will these properties have? (String, Int, Date, etc)
    * _Tip: Remember that this is just the definition of our struct, which is designed to hold the information about just 1 dog._
2. Create sample data
    * Create an array of dogs as a property of `DogModel`.
    * Use the [`static`](https://www.hackingwithswift.com/read/0/18/static-properties-and-methods) keyword on your property to make it belong to the type itself rather than instances.
    * You can use the "sampleDog" image in the assets folder or add your own dog images.
    * _Tip: Creating sample data is helpful when we want to preview our SwiftUI Views before we have full interactivity set up._
3. List `DogModel`'s sample data in ContentView
    * Replace string literals inside your [List](https://developer.apple.com/documentation/swiftui/list) with references to dog model properties.
    * _Tip: You'll need_ `DogModel` _to conform to the_ [`Identifiable`](https://www.hackingwithswift.com/books/ios-swiftui/working-with-identifiable-items-in-swiftui) _protocol to do this._
4. Define `DogSize` [enum](https://www.hackingwithswift.com/read/0/14/enumerations) (DogSize.swift)
    * Choose relevant cases to represent the sizes of dogs available.
    * If you defined size as a String in your `DogModel`, go back into and use your enum instead.
5. Update the [`Picker`](https://developer.apple.com/documentation/swiftui/picker) in NewSpotView
    * Instead of tagging the picker with strings, use the enum cases as tags.
    * Udpdate the `selectedSize` property of NewSpotView to rely on the enum instead of a string.

(Check out day-1-solution branch to see one potential solution to the above tasks.)

## DAY 2
### Create your ViewModel

1. Create an array of `DogModel` as a property of DogViewModel (DogViewModel.swift)
    * Use the [`@Published`](https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-published-property-wrapper) property wrapper to communicate with the view when the value changes.
2. Define the method `addNewDog(_: size:)`
    * Make sure you’re passing in the correct size enum value from from NewSpotView.
    * Create a new dog and add it to our array of dogs.
3. In ContentView, update List to use array you just created
    * Instead of something like `List(DogModel.sampleData`, use `List(dogVM.dogs)`.
4. Define the method `saveDogs()`
    * Use the method `DirectoryService.writeModelToDisk(_:)` to save the dogs the user has seen.
    * In order for this to work, you'll have to conform DogSize and DogModel to the [`Codable`](https://www.swiftbysundell.com/basics/codable/) protocol.
    * When should we save the dogs we have seen? The easiest place would be to save them every time we add a new dog.
6. Define the method `loadDogs()`
    * Use the method `DirectoryService.readModelFromDisk()` to load the dogs the user previously stored, and put the dogs we load back in our array.
    * _Tip: We'll want to call this method whenever the app opens, i.e. whenever a new instance of DogViewModel is created. We can call this method during [initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/) ._
7. Stretch Task: Swipe to delete dogs in ContentView

(Check out day-2-solution branch to see one potential solution to the above tasks.)

## DAY 3
### Access Protected Resources
1. In NewSpotView, add an action to the camera button to present the ImagePickerView
    * Run this app on a real phone. What error prints to the console when trying to access the camera?
2. Update the info.plist to request the user's permission to access their camera.
    * To add a new key to your info.plist, select the xcodeproj file in your project navigator, select the info tab, select the plus button on the bottom-most key in “Custom iOS Target Properties” and add you new key and description. 
3. Run the app again. You should be able to access the camera. Take a photo and see what happens.
4. To save the new photo to the DogModel, update DogModel to store a UIImage instead of a string imageName.
    * _Note: Check out UIImage+Codable.Swift if you want to learn how we were able to make a UIImage Codable so we could store it to the documents directory._
    * You can comment out the static property sampleDogs - 
5. Change the addNewDog function to take in - as a parameter - the NewSpotView property called uiimage.
6. Currently the save button is disabled if you haven't given the dog a name. Now we want to require the user to take a photo of the dog before saving it. Add to the .disabled modifier the condition to disable the button if the uiimage property is nil.
7. ContentView shows a SwiftUI Image from a UIImage instead of based on a string name.
    * _Tip: Use the_ `Image(uiImage:)` _initializer to make this happen._

## DAY 4
### Imprpove Accessibility

1. Improve VoiceOver experience by [labeling views](https://www.hackingwithswift.com/books/ios-swiftui/identifying-views-with-useful-labels) in a helpful way.
2. Choose your own [accent color](https://developer.apple.com/documentation/xcode/specifying-your-apps-color-scheme) and ensure it has light and dark mode, as well as high contrast versions for both modes.

## DAY 5
### Implement Localization

1. [Localize](https://developer.apple.com/documentation/xcode/localization) all static text in the app
    * Navigation titles
    * Buttons
    * Date label
    * DogSize - we might need to use [raw values](https://www.hackingwithswift.com/sixty/2/10/enum-raw-values) in our enum to do this
