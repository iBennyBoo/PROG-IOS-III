import Foundation
public class SaveScores: Codable{
    
    static var scores: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    static var names: [String] = ["", "", "", "", "", "", "", "", "", ""]
    
    var name: String = ""
    var score: Int = 0
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
    
    
    func sortArrays(){
        SaveScores.scores.append(score)
        SaveScores.scores.sort(by: >)
        SaveScores.scores.remove(at: 10)
        
        //change
        let index = SaveScores.scores.firstIndex(of: score)!
        SaveScores.names.insert(name, at: index)
        SaveScores.names.remove(at: 10)
        
        print(SaveScores.scores)
        
    }
}
