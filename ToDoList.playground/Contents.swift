import UIKit

class ToDoList{
    var id : Int
    var title : String
    var date : String
    var time : String
    enum priority : String  {
        case High
        case medium
        case Low
    }
    
    init(id : Int , title : String , date : String , time : String , priority : String ){
        self.id = id
        self.title = title
        self.date = date
        self.time = time
    }
}
class ReminderList : ToDoList{
    var list : [String]
    init (list : [String]){
    self.list = list
        super.init(id: 1010, title: "To Do List", date: "11 October", time: "12:00", priority: "Low")
    }
    func creatList (newList : [String]){
        let list : [String] = newList
        print("your new List is : \(list)")
    }
    
    func addItem (newItem : String){
        list.append(newItem)
        print("Successfully added")
        
    }
    
    func deletItem (removeItem : Int){
        if (removeItem > list.count || removeItem < 0){
            print("there is no item in this place!!")
        }else{
         list.remove(at: removeItem)
            print("Successfully removed")
        }
    }
    func printInfo(){
        print("your id \(id) the title of list is: \(title) the date and time: \(date) at \(time) the priority \(priority.Low) \n your to do list information is : \(list)")
    }
    func printList(){
        print("your to do list information is : \(list)")
    }
}

var mylist = ReminderList(list: ["call mom" , "go to superMarket"])
mylist.printInfo()
mylist.addItem(newItem: "do home work")
mylist.printList()
mylist.deletItem(removeItem: 0)
mylist.printList()
var mylist2 = ReminderList(list: ["go gym" , "visit aunt "])
mylist.addItem(newItem: "finish project")
mylist.printList()
mylist.deletItem(removeItem: 9)
mylist.printList()
