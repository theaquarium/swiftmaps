func readTextFile(_ path: String) -> (message: String, fileText: String?) {
    let text: String
    do {
        text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
    } catch let error {
        return ("\(error)", nil)
    }

    return ("", text)
}

func writeTextFile(_ path: String, data: String) -> String? {
    do {
        // Write contents to file
        try data.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
    } catch let error {
        return "\(error)"
    }

    return nil
}
