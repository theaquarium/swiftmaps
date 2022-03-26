import Foundation

let TASKS_PER_CYCLE = 100
let NUM_CYCLES = 100

// func getRandomInt(range: Range<Int>) -> Int {
//     return Int.random(in: range)
// }

func makeStringList(count: Int) -> [String] {
    let maxLength = String(count).count
    var list = [String]()
    for num in 0..<count {
        let str = String(num)
        // list.append(str)
        list.append(String(repeating: "0", count: maxLength - str.count) + str)
    }
    
    return list
}

// func makeString(length: Int) -> String {
//     let chars = Array("abcdefghijklmnopqrstuvwxyz")
//     var s = ""
//     let numberChars = chars.count
//     for _ in 0..<length {
//         s.append(chars[getRandomInt(range: 0..<numberChars)])
//     }
//     return s
// }
    
// func makeStringList(count: Int, length: Int = 10) -> [String] {
//     let chars = Array("abcdefghijklmnopqrstuvwxyz")
//     var list = [String]()
//     for num in 0..<count {
//         var str = ""
//         var remainingNum = num
//         for pos in 0..<length {
//             let mod = remainingNum % Int(pow(Double(chars.count), Double(pos)))
//             let char = chars[mod % chars.count]
//             // print(mod, char, remainingNum)
//             remainingNum -= mod
//             str.insert(char, at: str.startIndex)
//         }
//         list.append(str)
//     } 
    
//     return list
// }

func test(withMap map: Map<String, String>) -> (getResults: [Int], setResults: [Int]) {
    let strings = makeStringList(count: NUM_CYCLES * TASKS_PER_CYCLE)

    var setResults = [Int]()
    var getResults = [Int]()
    
    for cycle in 0..<NUM_CYCLES {
        for task in 0..<TASKS_PER_CYCLE {
            let str = strings[cycle * TASKS_PER_CYCLE + task]
            map[str] = str
            // usleep(100)
        }

        let setTimer = Timer()
        setTimer.startTimer()
        for task in 0..<TASKS_PER_CYCLE {
            let str = strings[cycle * TASKS_PER_CYCLE + task]
            map[str] = str
            // usleep(100)
        }
        setTimer.stopTimer()
        setResults.append(setTimer.elapsedTimeMs())

        let getTimer = Timer()
        getTimer.startTimer()
        for task in 0..<TASKS_PER_CYCLE {
            let str = strings[cycle * TASKS_PER_CYCLE + task]
            map.get(str)
            // usleep(100)
        }
        getTimer.stopTimer()
        getResults.append(getTimer.elapsedTimeMs())

        print("Cycle \(cycle): set \(setResults[cycle]), get \(getResults[cycle])")
        // print(map.count)
        // if cycle % 10 == 0 {
        //     // print("Cycle \(cycle): set \(setResults[cycle])")
        // }

    }

    return (getResults: getResults, setResults: setResults)
}

print("Test Linear")
let linear = test(withMap: LinearMap<String, String>(withCapacity: TASKS_PER_CYCLE * NUM_CYCLES))

print("Test Binary")
let binary = test(withMap: BinaryMap<String, String>(withCapacity: TASKS_PER_CYCLE * NUM_CYCLES))

print("Test Hash")
let hash = test(withMap: HashMap<String, String>(initialArraySize: 100 * TASKS_PER_CYCLE * NUM_CYCLES))

writeTextFile("graphs/data/linear.csv", data: createCSV(linear))
writeTextFile("graphs/data/binary.csv", data: createCSV(binary))
writeTextFile("graphs/data/hash.csv", data: createCSV(hash))
