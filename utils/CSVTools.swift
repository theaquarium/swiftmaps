func createCSV(_ input: (getResults: [Int], setResults: [Int])) -> String {
    let (getResults, setResults) = input

    var result = "cycle,gets,sets\n"
    for i in 0..<getResults.count {
        result += "\(i + 1),\(getResults[i]),\(setResults[i])\n"
    }
    return result
}
