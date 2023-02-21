//
//  Mooddiary.swift
//  MoodDiary
//
//  Created by Jitian Liang on 21/2/2023.
//

import Foundation

struct MoodDiary : Codable, Hashable {
//    var id: UUID = UUID() // needed if struct is Identifiable
    var date: String
    var value: Int
}

//extension MoodDiary {
//    static let list : [MoodDiary] = [
//        MoodDiary(date: "2023-02-01", value: 1),
//        MoodDiary(date: "2023-02-02", value: 2),
//        MoodDiary(date: "2023-02-03", value: 3),
//    ]
//}
