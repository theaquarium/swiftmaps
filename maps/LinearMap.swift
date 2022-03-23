class LinearMap<K: Hashable & Comparable, V>: Map<K, V> {
    private var keys: [K] = []
    private var values: [V] = []

    init(withCapacity: Int? = nil) {
        if let capacity = withCapacity {
            keys.reserveCapacity(capacity)
            values.reserveCapacity(capacity)
        }
    }

    private func findKeyIndex(_ k: K) -> Int? {
        for (index, key) in keys.enumerated() {
            if key == k {
                return index
            }
        }
        
        // if no matches found
        return nil
    }
    
    override var count: Int {
        return keys.count
    }

    override func set(_ k: K, _ v: V) {
        let optionalIndex = findKeyIndex(k)
        if let index = optionalIndex {
            values[index] = v
        } else {
            keys.append(k)
            values.append(v)
        }
    }

    override func remove(_ k: K) {
        let optionalIndex = findKeyIndex(k)
        if let index = optionalIndex {
            keys.remove(at: index)
            values.remove(at: index)
        }
    }

    override func get(_ k: K) -> V? {
        let optionalIndex = findKeyIndex(k)
        if let index = optionalIndex {
            return values[index]
        } else {
            return nil
        }
    }

    override var description: String {
        var result = "LinearMap [\n"

        for index in 0..<count {
            result += "    \(keys[index]): \(values[index]) \n"
        }

        result += "]"

        return result
    }

    override func makeIterator() -> MapIterator<K, V> {
        return MapIterator(keys, values)
    }
}
