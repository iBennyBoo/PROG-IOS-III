import UIKit

var passing = passingInfo.init()

class Results: UIViewController {
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let data = passing.returnData()
        if data == 0{
            header.text = "Seems You're Safe"
            body.text = "Looking at the results that you submitted, it would appear that you show zero symptoms of COVID-19. Make sure you are wearing your mask in public, washing your hands, and overall staying hygenic and safe."
        } else if data > 0{
            header.text = "Risk Detected"
            body.text = "Looking at the results that you submitted, it would appear that you may be showing one or more symptons of COVID-19. You may want to look into getting either a rapid-test or a complete test at a testing site. If it turns out that you do have the virus, quarantine for a bare minimu of 7 days, making sure you drink plenty of water while monitoring your health. Make sure you are wearing your mask in public, washing your hands, and overall staying hygenic and safe."
        }
    }
}
