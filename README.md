# DogSpotting

## DAY 1
### Model

Create dog model with 4 properties: name, dateSpotted, uiImage, and size
Create sample data
In ContentView, list DogModel.sampleData and replace literal strings with dog model properties (you’ll need to conform to identifiable protocol to do this)
Define DogSize as an enum
change the Picker in ContentView to go through enum cases instead of string

## DAY 2
### ViewModel

create @published var dogs: [DogModel]
define the method addNewDog, and make sure you’re passing in the enum from AddSpotView
change the dogs in List to reference vm.dogs
define saveDogs()
make dogsize, dogmodel codable
define loadDogs()
stretch: swipe to delete dogs

## DAY 3
### Protected resources

DogModel stores a UIImage instead of string imageName
ContentView shows an image from a UIImage instead of based on a string name

## DAY 4
### Accessibility

Discuss different ways to provide voiceover labels - children combine, ignore, etc
Choose your own accent color and ensure it has light, dark, high contrast versions

## DAY 5
### Localization

Localize all static text in the app (nav titles and buttons, date label, dog sizes)
