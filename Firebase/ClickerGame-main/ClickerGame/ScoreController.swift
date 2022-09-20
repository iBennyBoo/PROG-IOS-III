import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift
class ScoreController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let database = Firestore.firestore()
    
    var names: [String] = ["", "", "", "", "", "", "", "", "", ""]
    var scores: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    static var space = 0
    
    var name = ""
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
//        let docRef = database.collection("user").whereField("Joe", isEqualTo: true).getDocuments { querysnapshot, error in
//            if let error = error {
//                print(error)
//            } else{
//                for document in querysnapshot!.documents{
//                    print(document.data())
//                }
//            }
//        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        database.collection("user").getDocuments{
            snapshot, error in guard error == nil else {return}
            ScoreController.space = snapshot!.count
        }
        return ScoreController.space
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        let semibase = database.collection("user").order(by: "score", descending: true).limit(to: 10)
        semibase.getDocuments{
            snapshot, error in guard error == nil else {return}
            let doc = snapshot!.documents[indexPath.row]
            self.name = doc.documentID
            self.score = doc.data()["score"] as! Int
            cell.textLabel?.text = "\(self.name)"
            cell.detailTextLabel?.text = "\(self.score)"
        }
        //self.names = SaveScores.names
        //self.scores = SaveScores.scores
        //cell.textLabel?.text = "\(self.name)"
        //print(scores)
        //cell.detailTextLabel?.text = "\(self.score)"
        
        return cell
    }
}
