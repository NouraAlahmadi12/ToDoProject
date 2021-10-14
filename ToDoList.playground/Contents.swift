import UIKit
import Darwin

enum Priority {
    case High
    case medium
    case Low
}

enum Status {
    case complete
    case pending
}

enum TaskError : Error {
    
    case ItemNotFound
    case InvalidValue
    
}

struct Task {
    var id : Int
    var task : String
    var date : String
    var time : String
    var priority: Priority
    var status : Status
    
    mutating func editTask (newTask: String, newDate :String , newTime:String , newPriority: Priority){
        self.task = newTask
        self.date = newDate
        self.time = newTime
        self.priority = newPriority
    }
}
struct List {
    var title: String
    var items: [Task] = []
    
    mutating func addItem (newItem : Task) {
        self.items.append(newItem)
        print("Successfully added")
    }
    mutating func deletItem (byId : Int) throws {
        guard let deletTask = self.items.firstIndex(where: {$0.id == byId})
        else {
            throw TaskError.ItemNotFound
        }
        self.items.remove(at: deletTask)
        print("Successfully removed")
    }
    mutating func deleteAll(){
        self.items.removeAll()
        print("Successfully removed")
    }
    
    mutating func getTask(byId: Int) throws {
        guard let task = self.items.firstIndex(where: {$0.id == byId})
        else {
            throw TaskError.InvalidValue
        }
        print(task)
    }
    
    mutating func orderByComplete(){
        for item in self.items {
            if (item.status == .complete){
                print("\(item.task) - \(item.status)")
            }
        }
    }
    mutating func orderByPending (){
        for item in self.items {
            if (item.status == .pending){
                print("\(item.task) - \(item.status)")
            }
        }
    }
}

class Operation {
    var lists : [List] = []
    
    func readAllLists(){
        for list in self.lists {
            print("List: \(list.title) (\(list.items.count))")
            for item in list.items {
                print("Id task : \(item.id) - task :  \(item.task) - date : \(item.date) - time: \(item.time) - the priority is: \(item.priority) - status: \(item.status)")
            }
        }
    }
    func createNewList(list: List){
        
        self.lists.append(list)
        print(" added")
    }
    
}
var myLists = Operation()
var travelList = List(title: "travel List", items: [])
travelList.addItem(newItem: Task.init(id: 4, task: "go to tabuck", date: "25 October", time: "1:00pm", priority: .medium, status: .pending))
travelList.addItem(newItem: Task.init(id: 2, task: "go to jeddah", date: "23 October", time: "9:35am", priority: .medium, status: .complete))
travelList.addItem(newItem: Task.init(id: 1, task: "go to abha", date: "18 October", time: "7:43am", priority: .High, status: .complete))
travelList.addItem(newItem: Task.init(id: 3, task: "return to medinah", date: "27 October", time: "10:00am", priority: .High, status: .pending))
travelList.orderByComplete()
travelList.orderByPending()
do {
    try travelList.deletItem(byId: 3)
} catch TaskError.ItemNotFound {
    print ("Item not found")
} catch TaskError.InvalidValue {
    print ("Invalid Valud")
} catch {
    print ("Unknown Error")
}

do {
    try travelList.getTask(byId: 643)
    
} catch TaskError.ItemNotFound {
    print ("Item not found")
} catch TaskError.InvalidValue {
    print ("Invalid Valud")
} catch {
    print ("Unknown Error")
}
myLists.createNewList(list: travelList)
myLists.readAllLists()
var homeWorkList = List(title: "home Work List", items: [])
homeWorkList.addItem(newItem: Task.init(id: 1, task: "to do project", date: "14 October", time: "9:00am", priority: .High, status: .complete))
homeWorkList.addItem(newItem: Task.init(id: 35, task: "presentation", date: "14 October", time: "12:00pm", priority: .High, status: .pending))
myLists.createNewList(list: homeWorkList)
myLists.readAllLists()

