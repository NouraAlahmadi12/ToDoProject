# ToDoProject

# About my project (Overview)

- it's program that allow you to list your task and print it 

## Usage
- Add new task -  func addItem (newItem : Task)
- Edit existing task - editTask (newTask: String, newDate :String , newTime:String , newPriority: Priority)
- Delete existing task --------> deletItem (byId : Int)
- Get specific task by Id ---->  getTask(byId: Int) 
- Order By Complete  --------->  orderByComplete()
- Order By Pending ----------->  orderByPending () 
- Print all your tasks ------->  readAllLists()
- create New List ------------>  createNewList(list: List)

## favorite functions work
- DeleteTask(byId: Int) : Take Id and check if there task with this id delete it, other ways Throw error

## Technic

### declering 3 enums for : 
- Priority ( high , medium , Low)
- Status ( complete , pending)
- TaskError ( Item Not Found , Invalid Value)
- Use Throws to handle some error

## Future iterations
- Sort Lists by date
- Filter Items by date or completed status
