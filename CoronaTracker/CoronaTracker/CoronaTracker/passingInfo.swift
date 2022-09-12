import Foundation
import UIKit
public class passingInfo{
    static var info: Int = 0
    
    func getData(x: Int){
        passingInfo.info = x
    }
    
    func returnData() -> Int{
        return passingInfo.info
    }
}
