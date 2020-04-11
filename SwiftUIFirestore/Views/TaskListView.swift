//
//  TaskListView.swift
//  SwiftUIFirestore
//
//  Created by Nicholas Haley on 2020-04-11.
//  Copyright © 2020 Nicholas Haley. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    let tasks = testDataTasks
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(tasks) { task in
                    TaskCell(task: task)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                        Text("Add New Task")
                    }
                }.padding()
            }.navigationBarTitle("Tasks")
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View {
    let task: Task

    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20.0, height: 20.0)
            Text(task.title)
        }
    }
}
