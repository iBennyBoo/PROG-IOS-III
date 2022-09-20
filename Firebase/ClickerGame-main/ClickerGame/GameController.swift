import UIKit
import AVFoundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class GameController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    let database = Firestore.firestore()
    
    var moses: SaveScores!
    var audioPlayer: AVAudioPlayer?
    var count = 0
    var modifier = 1
    var time = 0.00
    var playing = true
    var timer: Timer!
    
    var name: String = "Jeff"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        image.image = UIImage(named: "Seaver")
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(GameController.viewDidLoad), userInfo: nil, repeats: true)
        button.isHidden = true
        playing = true
        updateTimer()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
        button.isHidden = true
        time = 0
        count = 0
        modifier = 1
        label.text! = "Score: 0 Points"
        timerLabel.text! = "0 Seconds"
        
    }
    
    @objc func updateTimer(){
        time = time + 0.01
        time = round(time * 100) / 100.0
        if(time == 1){
            timerLabel.text! = "\(time) Second"
        }else if (time == 30.01){ //set back to 30.01
            timer.invalidate()
            button.isHidden = false
            playing = false
            image.image = UIImage(named: "Seaver")
            playEndSound()
            let alert = UIAlertController(title: "You scored \(count) points!", message: "Would you like to push score to global leaderboard?", preferredStyle: .alert)
            let no = UIAlertAction(title: "By No Means", style: .default, handler: nil)
            let yes = UIAlertAction(title: "By All Means", style: .default, handler: { [self] action in
                let alert2 = UIAlertController(title: "Enter name below.", message: nil, preferredStyle: .alert)
                alert2.addTextField { (textField) in
                    textField.placeholder = "Name"
                    textField.resignFirstResponder()
                    //textField.isSecureTextEntry = true
                }
                let continue1 = UIAlertAction(title: "Continue",style: .default) { [weak alert2] _ in
                        guard let textFields = alert2?.textFields else { return
                        }
                    name = textFields[0].text!
                    moses = SaveScores.init(name: name, score: count)
                    writeData()
                    moses.sortArrays()
                    
                    
                    
                    }

                alert2.addAction(continue1)
                present(alert2, animated: true, completion: nil)
            })
            alert.addAction(no)
            alert.addAction(yes)
            present(alert, animated: true, completion: nil)
            
            
        } else{
            timerLabel.text! = "\(time) Seconds"
        }
        
    }
    
    @IBAction func button(_ sender: UIButton) {
        button.isHidden = true
        playing = true
        time = 0
        count = 0
        modifier = 1
        image.image = UIImage(named: "Seaver")
        label.text! = "Score: 0 Points"
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(GameController.viewDidLoad), userInfo: nil, repeats: true)
        
    }
    
    func writeData(){
        let docRef = database.document("user/\(name)")
        docRef.setData(["score": count])
    }
    
            
        
    
    
    @IBAction func tapSeaver(_ sender: UITapGestureRecognizer) {
        if(playing == true){
            count = count + modifier
        label.text! = "Score: \(count) points"
            if(count == 1){
                image.image = UIImage(named: "SuperSaiyanSeaver")
                playStartSound()
            } else if (count == 75){
                image.image = UIImage(named: "SuperSaiyanGodSeaver")
                playStartSound()
            } else if (count == 300){
                image.image = UIImage(named: "SuperSaiyanBlueSeaver")
                playStartSound()
            }
            
        if(count > 299){
            modifier = 20
        } else if (count > 74){
            modifier = 5
        } else{
            modifier = 1
        }
        }
    }
    
    func playStartSound(){
        let sound = Bundle.main.path(forResource: "DBZ sound effect", ofType: "m4a")!
        let url = URL(fileURLWithPath: sound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error!")
        }
    }
    
    func playEndSound(){
        let sound = Bundle.main.path(forResource: "DBZ sound effect 2", ofType: "m4a")!
        let url = URL(fileURLWithPath: sound)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("error!")
        }
    }
    
    
    
}
