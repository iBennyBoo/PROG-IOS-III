//
//  InterfaceController.swift
//  CoinFlip_Watch WatchKit Extension
//
//  Created by Ben Berman on 9/20/22.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

    @IBAction func flip() {
        label.setText("Flipping the coin.")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.label.setText("Flipping the coin..")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                
                self.label.setText("Flipping the coin...")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    let randomFlip = Bool.random()
                    if(randomFlip){
                        self.label.setText("It's Heads")
                    } else{
                        self.label.setText("It's Tails")
                    }
                }
            }
        }
    }
    
}
