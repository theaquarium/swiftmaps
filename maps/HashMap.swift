class HashMap<K : Hashable & Comparable, V>: Map<K, V> {
    private var keys: [K?]
    private var values: [V?]
    private var collisions = BinaryMap<K, V>()
    private var numCollisions = 0
    
    init(initialArraySize: Int = 100) {
        keys = Array(repeating: nil, count: initialArraySize)
        values = Array(repeating: nil, count: initialArraySize)
    }

    private func getInternalHash(of k: K) -> Int {
        return abs(k.hashValue % keys.count)
    }

    func getNumberCollisions()-> Int {
        return numCollisions
    }

    override func set(_ k: K, _ v: V) {
        let hash = getInternalHash(of: k)
        if let key = keys[hash], key != k {
            numCollisions += 1
            collisions[k] = v
        } else {
            keys[hash] = k
            values[hash] = v
        }
    }

    override func remove(_ k: K) {
        let hash = getInternalHash(of: k)
        if let key = keys[hash], key != k {
            collisions.remove(k)
        } else {
            keys[hash] = nil
            values[hash] = nil
        }
    }

    override func get(_ k: K) -> V? {
        let hash = getInternalHash(of: k)
        if let key = keys[hash], key == k {
            return values[hash]
        } else if let collidedValue = collisions[k] {
            numCollisions += 1
            return collidedValue
        } else {
            return nil
        }
    }

    override var count: Int {
        return keys.filter { $0 != nil }.count + collisions.count
    }

    override var description: String {
        var result = "HashMap [\n"

        for index in 0..<keys.count {
            if keys[index] != nil {
                result += "    \(keys[index]!): \(values[index]!) \n"
            }
        }

        // add collisions
        for (key, value) in collisions {
            result += "    \(key): \(value) \n"
        }

        result += "]"

        return result
    }

    override func makeIterator() -> MapIterator<K, V> {
        var newKeys = [K]()
        var newValues = [V]()

        for index in 0..<keys.count {
            if let key = keys[index] {
                newKeys.append(key)
                newValues.append(values[index]!)
            }
        }

        for (key, value) in collisions {
            newKeys.append(key)
            newValues.append(value)
        }
        
        return MapIterator(newKeys, newValues)
    }
}