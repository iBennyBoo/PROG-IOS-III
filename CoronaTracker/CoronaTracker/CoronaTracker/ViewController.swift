import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var firstControl: UISegmentedControl!
    @IBOutlet weak var secondControl: UISegmentedControl!
    @IBOutlet weak var thirdControl: UISegmentedControl!
    @IBOutlet weak var fourthControl: UISegmentedControl!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var button: UIButton!
    
    let passing = passingInfo.init()
    
    var hasCoivd = 0
    var clickedOne = 0
    var clickedTwo = 0
    var clickedThree = 0
    var clickedFour = 0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.isHidden = true
    }

    @IBAction func firstControl(_ sender: UISegmentedControl) {
        if firstControl.selectedSegmentIndex == 0 && clickedOne == 0{
            progressBar.progress += 0.25
            clickedOne = 1
            if count != 0{
                count -= 1
            }
        } else if firstControl.selectedSegmentIndex == 1 && clickedOne == 0{
            progressBar.progress += 0.25
            clickedOne = 1
            count += 1
        }
        
        if progressBar.progress == 1{
            button.isHidden = false
        }
    }
    
    @IBAction func secondControl(_ sender: UISegmentedControl) {
        if firstControl.selectedSegmentIndex == 0 && clickedTwo == 0{
            progressBar.progress += 0.25
            clickedTwo = 1
            if count != 0{
                count -= 1
            }
        } else if firstControl.selectedSegmentIndex == 1 && clickedTwo == 0{
            progressBar.progress += 0.25
            clickedTwo = 1
            count += 1
        }
        
        if progressBar.progress == 1{
            button.isHidden = false
        }
    }
    
    @IBAction func thirdControl(_ sender: UISegmentedControl) {
        if firstControl.selectedSegmentIndex == 0 && clickedThree == 0{
            progressBar.progress += 0.25
            clickedThree = 1
            if count != 0{
                count -= 1
            }
        } else if firstControl.selectedSegmentIndex == 1 && clickedThree == 0{
            progressBar.progress += 0.25
            clickedThree = 1
            count += 1
        }
        
        if progressBar.progress == 1{
            button.isHidden = false
        }
    }
    
    @IBAction func fourthControl(_ sender: UISegmentedControl) {
        if firstControl.selectedSegmentIndex == 0 && clickedFour == 0{
            progressBar.progress += 0.25
            clickedFour = 1
            if count != 0{
                count -= 1
            }
        } else if firstControl.selectedSegmentIndex == 1 && clickedFour == 0{
            progressBar.progress += 0.25
            clickedFour = 1
            count += 1
        }
        
        if progressBar.progress == 1{
            button.isHidden = false
        }
    }
    
    @IBAction func button(_ sender: UIButton) {
        passing.getData(x: count)
    }
    
}

