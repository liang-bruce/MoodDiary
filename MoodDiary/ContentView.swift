//
//  ContentView.swift
//  MoodDiary
//
//  Created by Jitian Liang on 21/2/2023.
//

import SwiftUI

struct ContentView: View {
    // instantiate MoodDiaryStorage object to use it's function
    @StateObject var moodDiaryStorage = MoodDiaryStorage()

       @State private var selectedValue = 1

       let ratingValues = [1, 2, 3, 4, 5]

       var body: some View {
           VStack {
               Picker(selection: $selectedValue, label: Text("Select a rating value")) {
                   ForEach(ratingValues, id: \.self) { value in
                       Text("\(value)")
                   }
               }
               .pickerStyle(.segmented)
               
               // Use add Mood function (takes an integer input)
               Button(action: {
                   moodDiaryStorage.addMood(value: selectedValue)
               }, label: {
                   Text("Add Rating")
               })
               
               List(moodDiaryStorage.moodDiary, id: \.self) { mood in
                   Text("date: \(mood.date), value: \(mood.value)")
                       }
               
               // use clear history function, no input needed
               Button(action: {
                   moodDiaryStorage.clearHistory()
                   
               }, label: {Text("clear history")})
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
