//
//  TaskCellViewModel.swift
//  SwiftUIFirestore
//
//  Created by Nicholas Haley on 2020-04-11.
//  Copyright © 2020 Nicholas Haley. All rights reserved.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskResposity = TaskRepository()
    
    // Ensure any change on the Task can be listened to with published annotation
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        taskResposity.$tasks.map { tasks in
            tasks.map { task in
                TaskCellViewModel(task: task)
            }
        }
        .assign(to: \.taskCellViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func addTask(task: Task) {
        taskResposity.addTask(task)
        
//        let taskVM = TaskCellViewModel(task: task)
//        self.taskCellViewModels.append(taskVM);
    }
}
