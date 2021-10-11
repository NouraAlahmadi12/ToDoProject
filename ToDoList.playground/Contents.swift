import UIKit

enum Priority {
    case High
    case medium
    case Low
}
struct Task{
    var id : Int
    var title : String
    var date : String
    var time : String
    var priority : Priority

}
class Operation {
    var theList : [Task]
    
    init(theList : Task) {
        self.theList = [theList]
    }
    func addItem (newItem : Task) {
        theList.append(newItem)
        print("Successfully added")
    }
    
    func deletItem (removeItem : Int){
        if (removeItem > theList.count || removeItem < 0){
            print("there is no item in this place!!")
        }else{
         theList.remove(at: removeItem)
            print("Successfully removed")
        }
    }
    func printList(){
        print("your to do list information is : \(theList)")
    }
}

var mylist = Operation(theList: Task.init(id: 09, title: "do project", date: "11 October", time: "9:00am", priority: .High))
mylist.addItem(newItem: Task.init(id: 08, title: "go to gym", date: "11 Octiber", time: "1:00am", priority: .Low))
mylist.printList()
mylist.deletItem(removeItem: 0)
mylist.printList()

