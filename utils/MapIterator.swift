struct MapIterator<K, V>: IteratorProtocol {
    let keys: [K]
    let values: [V]
    var count = 0

    init(_ keys: [K], _ values: [V]) {
        self.keys = keys
        self.values = values
    }

    mutating func next() -> (K, V)? {
        guard count < keys.count
            else { return nil }

        defer {
            count += 1
        }

        return (keys[count], values[count])
    }
}