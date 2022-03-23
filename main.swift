import Foundation

let TASKS_PER_CYCLE = 100
let NUM_CYCLES = 10

func getRandomInt(range: Range<Int>) -> Int {
    return Int.random(in: range)
}

func makeStringList(count: Int) -> [String] {
        var list = [String]()
        for num in 0..<count {
            list.append(String(num))
        } 
        
        return list
    }

func test(withMap map: Map<String, String>) {
    let strings = makeStringList(count: NUM_CYCLES * TASKS_PER_CYCLE)

    var setResults = [Int]()
    var getResults = [Int]()
    
    for cycle in 0..<NUM_CYCLES {
        let setTimer = Timer()
        setTimer.startTimer()
        for task in 0..<TASKS_PER_CYCLE {
            let str = strings[cycle * TASKS_PER_CYCLE + task]
            map[str] = str
        }
        setTimer.stopTimer()
        setResults.append(setTimer.elapsedTimeMs())

        let getTimer = Timer()
        getTimer.startTimer()
        for task in 0..<TASKS_PER_CYCLE {
            let str = strings[cycle * TASKS_PER_CYCLE + task]
            map.get(str)
        }
        getTimer.stopTimer()
        getResults.append(getTimer.elapsedTimeMs())

        print("Cycle \(cycle): set \(setResults[cycle]), get \(getResults[cycle])")
    }

    print(setResults, getResults)
}

test(withMap: LinearMap<String, String>())
