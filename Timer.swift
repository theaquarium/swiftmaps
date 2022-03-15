import Foundation

var startTaskms: Int64 = 0
var endTaskms: Int64 = 0

func getCurrentMs() -> Int64 {
                              return Int64(Date().timeIntervalSince1970 * 1000)
}

func startTimer() {
                   startTaskms = getCurrentMs()
}

func endTimer() {
                   endTaskms = getCurrentMs()
}

func elapsedMs() -> Int64 {
                  return endTaskms - startTaskms
}


var a = [""]

startTimer()
for i in 0...100000 {
                  a.append(String(i))
}
endTimer()
print(elapsedMs())