import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334") {
            if let data = NSData(contentsOf: url as URL){
                do{
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                    let newDict = parsed
                    
                    print(newDict["currently"]!["summary"] as Any)
                    print(newDict["currently"]!["temperature"] as Any)
                    print(newDict["currently"]!["dewPoint"] as Any)
                    
                    self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!)"
                    self.currentSummary.text = "\(newDict["currently"]!["summary"]!!)"
                    self.currentlyDewpoint.text = "\(newDict["currently"]!["dewPoint"]!!)"
                }
                catch let error as NSError{
                    print("A JSON parsithing error occured")
                }
            }
    }


}
    @IBOutlet weak var currentTemp: UILabel!
    
    @IBOutlet weak var currentSummary: UILabel!
    @IBOutlet weak var currentlyDewpoint: UILabel!
}
