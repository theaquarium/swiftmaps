class CollisionSafeHashMap<K : Hashable & Comparable, V>: Map<K, V> {
    private var keys: [[K]]
    private var values: [[V]]
    private var numCollisions = 0
    private var countInternal = 0
    
    init(initialArraySize: Int = 100) {
        keys = Array(repeating: [K](), count: initialArraySize)
        values = Array(repeating: [V](), count: initialArraySize)
    }

    private func getInternalHash(of k: K) -> Int {
        return abs(k.hashValue % keys.count)
    }

    func getNumberCollisions()-> Int {
        return numCollisions
    }

    override func set(_ k: K, _ v: V) {
        let hash = getInternalHash(of: k)
        let elements = keys[hash]
        let (inArray, index) = binarySearch(elements: elements, target: k)
        // increment collision counter
        if elements.count > 1 {
            numCollisions += 1
        }

        if inArray {
            values[hash][index] = v
        } else {
            countInternal += 1
            keys[hash].insert(k, at: index)
            values[hash].insert(v, at: index)
        }
    }

    override func remove(_ k: K) {
        let hash = getInternalHash(of: k)
        let elements = keys[hash]
        let (inArray, index) = binarySearch(elements: elements, target: k)

        // increment collision counter
        if elements.count > 1 {
            numCollisions += 1
        }

        if inArray {
            countInternal -= 1
            keys[hash].remove(at: index)
            values[hash].remove(at: index)
        }
    }

    override func get(_ k: K) -> V? {
        let hash = getInternalHash(of: k)
        let elements = keys[hash]
        let (inArray, index) = binarySearch(elements: elements, target: k)

        // increment collision counter
        if elements.count > 1 {
            numCollisions += 1
        }

        if inArray {
            return values[hash][index]
        } else {
            return nil
        }
    }

    override var count: Int {
        return countInternal
    }

    override var description: String {
        var result = "CollisionSafeHashMap [\n"

        for index in 0..<keys.count {
            let elements = keys[index]
            for itemIndex in 0..<elements.count {
                result += "    \(elements[itemIndex]): \(values[itemIndex]) \n"
            }
        }

        result += "]"

        return result
    }

    override func makeIterator() -> MapIterator<K, V> {
        var newKeys = [K]()
        var newValues = [V]()

        for index in 0..<keys.count {
            let elements = keys[index]
            for itemIndex in 0..<elements.count {
                newKeys.append(elements[itemIndex])
                newValues.append(values[index][itemIndex])
            }
        }
        
        return MapIterator(newKeys, newValues)
    }
}
