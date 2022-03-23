public class Benchmark {
    

    /*func makeString(length: Int) -> String {
        var s = ""
        let numberChars = chars.count
        for _ in 0..<length {
            s.append(chars[getRandomInt(range: 0..<numberChars)])
        }
        return s
    }*/
    
    /*func makeStringList(count: Int, length: Int) -> [String] {
        let chars = Array("abcdefghijklmnopqrstuvwxyz")
        var list = [String]()
        for num in 0..<count {
            var str = ""
            var remainingNum = num
            for pos in 0..<length {
                let mod = remainingNum % Int(pow(Double(chars.count), Double(pos)))
                let char = chars[mod % chars.count]
                print(mod, char, remainingNum)
                remainingNum -= mod
                str.insert(char, at: str.startIndex)
            }
            list.append(str)
        } 
        
        return list
    }*/

    func doTest() -> Bool {
        print()
        let strings = makeStringList(count: 270)
        
        return true
        /*var setResults = [Int64]()
        var getResults = [Int64]()
        makeStringList(size: MAX_SIZE)
        print("String List Complete")
        var value = ""

        var key = ""
        var index = 0

        startTimer()
        for i in 0..<NUMBER_PUTS {

            map.set(stringList[i], v: stringList[i])
        }

        stopTimer()

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
        return true*/

    }
}