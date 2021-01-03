# Swift Basics 1
 LEARN 📝 | Example of Delegate Design Pattern in Swift 5.1

## Explanation: ITS LIKE A PHONE CALL ☎️

### Protocols
This is the Delegate representation as a "cake from pan". Metaphorically, is: How the calls between two people needs to be?
````Swift
protocol AdvanceLifeSupport{
    func peformCPR()
}
````
### Add delegate as attribute in class
````Swift
class EmergencyCallHandler{
    var delegate:AdvanceLifeSupport?
    
    func assesSituation(){
        print("Can you tell what happened?")
    }
    
    func medicalEmergency(){
        delegate?.peformCPR()
    }
}
````
### Initialize the Delegate in Struct/Class
We need to initialize the "Delegate" to be able to this this "Struct" receive calls  
````Swift
struct parametric:AdvanceLifeSupport{
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func peformCPR() {
        print("The parametric does chest compression, 30 per second")
    }
    
}
````
### Seeing in action
When peter call medicalEmergency ,Joao will receive this and start performCPR as does he knows
````Swift
let peter = EmergencyCallHandler()
let joao = parametric(handler: peter)
peter.medicalEmergency()
````
## When Use?

When can use to everything, especially Http Request with parallel threads to be communicated to Views, furthermore is very comma use delegates in TextViews and TableViews! Like:

### ViewController
The ViewController has a tableView and we initialize it
````Swift

@IBOutlet weak var tableView: UITableView!

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
    tableView.delegate = self
    }
}
````
### Extension of this ViewController
This will trigger the tableView to change the data of it.

````Swift
//MARK: - ChatTableViewDataSource
extension ChatViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the number of cells of the tables
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //return the cell content
    }
    
}
````
Besides that, we create a extension to separate our code and make it more organized
