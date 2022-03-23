import Foundation

class Timer {
    var startTaskms: Int = 0
    var endTaskms: Int = 0

    static func getCurrentMillis() -> Int {
        return Int(Date().timeIntervalSince1970 * 1000000)
    }
    
    func startTimer() {
        startTaskms = Timer.getCurrentMillis()
    }
    
    func stopTimer() {
        endTaskms = Timer.getCurrentMillis()
    }
    
    func elapsedTimeMs() -> Int {
        return endTaskms - startTaskms
    }
}
