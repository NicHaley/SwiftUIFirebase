//
//  Task.swift
//  SwiftUIFirestore
//
//  Created by Nicholas Haley on 2020-04-11.
//  Copyright © 2020 Nicholas Haley. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    @ServerTimestamp var createdTime: Timestamp?
    var title: String
    var completed: Bool
}


#if DEBUG
let testDataTasks = [
    Task(title: "yolo", completed: true),
    Task(title: "yolo2", completed: false)
]
#endif
