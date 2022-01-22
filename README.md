# iOS App: ONG
## _Nuwe Femhack Individual Challenge_

¡Hola mundo!

What a joy to participate in my first hackaton!. I was asked to create an app for an ONG where they could manage their stakeholders and projects. It was very fun and such a challenge so let's get to it. 👀 

The app has three main views:
- A dashboard: That in a version 2.0 will show information from the data gathered in the creation of the stakeholers and project.
- An "Add stakeholder" view, where the ONG can create a new Stakeholder.
- An "Add project" view, where the ONG can create a new project.

<img src="https://user-images.githubusercontent.com/81619759/150657126-538ea4b5-d4d7-404b-b509-568f304d9fba.png" alt="App view of the dashboard" width="300"/> <img src="https://user-images.githubusercontent.com/81619759/150657135-84391c8a-a85e-47ec-a4a2-34a0fbc919cc.png" alt="App view wof add stakeholders" width="300"/> <img src="https://user-images.githubusercontent.com/81619759/150657139-9e55b00c-7f5b-4cb7-b7c5-fc5549729203.png" alt="App view of add projects" width="300"/>

## Initial Requirements 📋

- A view that allows the ONG to add stakeholders:
    - Fullname
    - Email (only email format can be added)
    - Website
    - Projects funded: Array of projects names
    - Amount (€)
    
- A view that allows the ONG to add projects:
    - Name
    - Website (only links can be aded)
    - Description (long text)
    - Image
    - Budget (€)
    - Closing date (Date format)

- A Dashboard that allows to easily see
    - Number of projects funded
    - Number of Stakeholders
    - Total money raised
    - Average funds per project closed

- Communicate the user any possible error in the creation of any entity
- Plus: Add a database
    
## Extra features of my own🚀 

- Add a tab bar
- Dinamic add of projects in stakeholder creation
- Customize app icon and launch screen
- Create color scheme

## Built with 🔨
- XCode
- SwiftUI
- PhotosUI

## Development ⌨️

I started the challenge using a pseudocode approach just to be sure that I didn't miss any requirement and to help me start in an organized way ✅ 

The whole project was done following a MVVM approach and first of all I worked with the creation of the Stakeholders 🎩. and Projects. I will explain both together as they have many similarities.  For each I created and entity with all of the specifications requested and with defined types.

After it I started working on the models and viewModels of each. Both have some common methods such as the ´save()´ in which I append the information provided by the user to an array. A ´cleanValues()´ method that as it's name states clean the values once the information was saved so the user can add a new one.

Then I created some validation methods, this methods check the values that the user has shared so we can be sure they are correct. For this checks I used regEx and the methods returns a boolean that if returns false will trigger an Alert to the user.

<img src="https://user-images.githubusercontent.com/81619759/150657510-2e69c003-b7be-484b-b671-e81216046f4e.png" alt="Alerts for invalid project" width="300"/> 

💫 The last method used is ´formIsEmpty´, this is one of my favorite features because is simple and prevents the user to send incomplete forms. Basically checks that all the fields are filled and if so the view will render the "Save" or "Cancel" button. 

For the Dashboard sadly I wasn't able to fullfill all the requirements but will definetly go to a version 2.0.

## Challenges and cool stuff 💖

🖼️  **Image** 🖼️

Until now I've never created any project that required the user to upload an image. For doing so I used PhotosUI following [this tutorial](https://www.hackingwithswift.com/books/ios-swiftui/integrating-core-image-with-swiftui) it wasn't super easy neither too hard, is easy to understand and is an reusable component so that's definetly a plus

✅ **Extra validations** ✅

As I was doing the mandatory validations I noticed that both the amount funded and the budget values could be validated just to be sure that the input always receive a Double as intended. The validation is pretty simple and could save us from future problems

´´´swift

        func isValidAmount(amount: String) -> Bool {
        
        var returnValue = true
        let budgetRegex = "^[0-9.]{1,10}$"
        
        do {
            let regex = try NSRegularExpression(pattern: budgetRegex)
            let nsString = budget as NSString
            let results = regex.matches(in: budget, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch _ as NSError {
            print("invalid")
            returnValue = false
        }
        
        return  returnValue
    }
 ´´´

➕**Dinamically adding projects** ➕

When an user creates a stakeholder, this stakeholder can have many "projects funded" and this value is an array of strings. For so in the view, I decided to create a dinamic field, this way if the user can add as much projects as they need to.

![Screenshot 2022-01-22 at 23 48 05](https://user-images.githubusercontent.com/81619759/150657844-a4c7d463-2ef1-443e-80ec-78b78cc8a012.png)

## Thinkgs to work in 🔨

⌛ Time management: It was a big challenge and at first lost a lot of time trying to use CoreData to create a data base and this was a plus. So definetly to keep focus first on the must and later on the extras to have an MVP.

🏅 Dashboard: The dashboard is incomplete so, will finish it as soon as possible.

🌙 Dark mode: I love to fix my apps to respond correctly to dark mode, so definetly will do a fast fix to do this. 

🔨 Core Data: Will definetly learn more about it and implement it in a new version of the app

## Want to clone this repo? 🐑

If you want to clone this repo please feel free to! 

## Codefactor
[![CodeFactor](https://www.codefactor.io/repository/github/silviaespanagil/superwoman-femhack-challenge/badge)](https://www.codefactor.io/repository/github/silviaespanagil/superwoman-femhack-challenge)
