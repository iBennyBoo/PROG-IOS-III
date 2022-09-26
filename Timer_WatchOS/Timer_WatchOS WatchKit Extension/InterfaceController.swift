//
//  InterfaceController.swift
//  Timer_WatchOS WatchKit Extension
//
//  Created by Ben Berman on 9/23/22.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var TimerLabel: WKInterfaceLabel!
    @IBOutlet weak var StartButton: WKInterfaceButton!
    @IBOutlet weak var ResetButton: WKInterfaceButton!
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    override func awake(withContext context: Any?) {
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    @IBAction func startAction() {
        if(timerCounting){
            timerCounting = false
            timer.invalidate()
            StartButton.setTitle("Start")
        } else{
            timerCounting = true
            StartButton.setTitle("Stop")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func resetAction() {
        count = 0
        timer.invalidate()
        TimerLabel.setText(makeString(hours: 0, minutes: 0, seconds: 0))
        StartButton.setTitle("Start")
    }
    
    @objc func timerCounter() -> Void{
        count = count + 1
        let time = converter(seconds: count)
        let timeString = makeString(hours: time.0, minutes: time.1, seconds: time.2)
        TimerLabel.setText(timeString)
    }
    func converter(seconds: Int) -> (Int, Int, Int){
        return ((seconds / 3600), ((seconds % 3600)/60), ((seconds % 3600) % 60))
    }
    func makeString(hours: Int, minutes: Int, seconds: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}
