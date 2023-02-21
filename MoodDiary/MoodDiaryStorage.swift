//
//  MoodDiaryStorage.swift
//  MoodDiary
//
//  Created by Jitian Liang on 21/2/2023.
//

import Foundation

// the class act as wrapper function of Storage functions
class MoodDiaryStorage: ObservableObject {
    // data is stored in this array
    @Published var moodDiary: [MoodDiary] = []
    
    // fetch data from "somewhere" when this class is instantiated
    init() {
        fetch()
    }
    
    // save the array to JSON file
    func persist(_ items : [MoodDiary]) {
        Storage.store(items, to: .documents, as: "diary_list.json")
    }
    
    // read the "diary_list.json file from somewhere inside the app
    // Note: don't worry if you cannot find the file in left hand side (main bundle)
    //       use fetch and dispaly (already done in content view) to check and test
    //       it is not saved in main bundle but somewhere else.
    //       the files in main bundle is read only
    func fetch() {
        let list = Storage.retrive("diary_list.json", from: .documents, as: [MoodDiary].self) ?? []
        moodDiary = list
    }
    
    // Append the new mood to the moodDiary array
    func addMood(value: Int) {
        let mood = MoodDiary(date: formattedDate(), value: value)
        // overwrite same date entry
        if (mood.date == moodDiary.last?.date) {
            moodDiary.removeLast()
        }
        moodDiary.append(mood)
        persist(moodDiary)
    }
    
    // format date as string
    private func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
    
    // remove diary_list.json in the "somewhere" directory
    func clearHistory(){
        Storage.remove("diary_list.json", from: .documents)
        moodDiary = []
    }
}
