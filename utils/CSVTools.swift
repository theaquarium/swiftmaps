func createCSV(_ input: (getResults: [Int], setResults: [Int])) -> String {
    let (getResults, setResults) = input

    var result = "Gets, Sets\n"
    for i in 0..<getResults.count {
        result += "\(getResults[i]),\(setResults[i])\n"
    }
    return result
}
