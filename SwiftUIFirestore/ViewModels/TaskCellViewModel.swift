//
//  TaskCellViewModel.swift
//  SwiftUIFirestore
//
//  Created by Nicholas Haley on 2020-04-11.
//  Copyright © 2020 Nicholas Haley. All rights reserved.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var taskResposity = TaskRepository()
    // Ensure any change on the Task can be listened to with published annotation
    @Published var task: Task
    
    var id = ""
    @Published var completionStateIconName = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task.map { task in
            task.completed ? "checkmark.circle.fill" : "circle"
        }
        .assign(to: \.completionStateIconName, on: self)
        .store(in: &cancellables)
        
        $task.compactMap { task in
            task.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
        
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { task in
                self.taskResposity.updateTask(task)
            }
            .store(in: &cancellables)
    }
}
