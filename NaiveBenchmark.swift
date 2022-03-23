import Foundation

func getCurrentMillis() -> Int64 {
    return Int64(Date().timeIntervalSince1970 * 1000)
}

public class NaiveBenchmark {

    var stringList = [String]()
    let chars = Array("abcdefghijklmnopqrstuvwxyz")

    let MAX_SIZE = 400000
    let NUMBER_GETS = 200000
    let NUMBER_PUTS = 200000

    var startTaskms: Int64 = 0
    var endTaskms: Int64 = 0

    func startTimer() {
        startTaskms = getCurrentMillis()
    }

    func stopTimer() {
        endTaskms = getCurrentMillis()
    }

    func elapsedTimems() -> Int {
        return Int(endTaskms - startTaskms)
    }

    func elapsedTimeSeconds() -> Int {
        return elapsedTimems() / 1000
    }

    func elapsedTimeTenthsSeconds() -> Int {
        return elapsedTimems() / 100
    }

    func benchmarkMessageTenths(mess: String) {
        print("\(mess) took \(elapsedTimeTenthsSeconds()) tenths of a second")
    }

    func getRandomInt(range: Range<Int>) -> Int {
        return Int.random(in: range)
    }

    func makeString(length: Int) -> String {
        var s = ""
        let numberChars = chars.count
        for _ in 0..<length {
            s.append(chars[getRandomInt(range: 0..<numberChars)])
        }
        return s
    }
    func makeStringList(size: Int) {
        stringList = [String]()
        for _ in 0..<size {
            stringList.append(makeString(length: 10))
        }
    }

    func doTest() -> Bool {
        makeStringList(size: MAX_SIZE)
        print("String List Complete")
        var value = ""

        var key = ""
        var index = 0
        let map = BinaryMap<String, String>()

        startTimer()
        for i in 0..<NUMBER_PUTS {

            map.set(stringList[i], v: stringList[i])
        }

        stopTimer()
        benchmarkMessageTenths(mess: "\(NUMBER_PUTS)  put operations ")

        startTimer()

        for _ in 0..<NUMBER_GETS {
            index = getRandomInt(range: 0..<NUMBER_PUTS)
            key = stringList[index]
            value = map.get(key)!
            if !(value == key) {
                return false
            }
        }

        stopTimer()
        benchmarkMessageTenths(mess: "\(NUMBER_GETS)  get operations ")
        // print(map.getNumberCollisions())
        return true

    }
}

func doBenchmark() {
    print("Lets go!")
    let nb = NaiveBenchmark()
    if nb.doTest() {
        print("Map OK")
    } else {
        print("Map Bad")
    }
}

doBenchmark()
