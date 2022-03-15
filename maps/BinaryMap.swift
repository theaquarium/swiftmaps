class BinaryMap<K : Hashable & Comparable, V>: Map<K, V> {
    private var keys: [K] = []
    private var values: [V] = []
    
    override func set(_ k: K, _ v: V) {
        let (inArray, index) = binarySearch(elements: keys, target: k)
        if inArray {
            values[index] = v
        } else {
            keys.insert(k, at: index)
            values.insert(v, at: index)
        }
    }

    override func remove(_ k: K) {
        let (inArray, index) = binarySearch(elements: keys, target: k)
        if inArray {
            keys.remove(at: index)
            values.remove(at: index)
        }
    }

    override func get(_ k: K) -> V? {
        let (inArray, index) = binarySearch(elements: keys, target: k)
        if inArray {
            return values[index]
        } else {
            return nil
        }
    }

    override var count: Int {
        return keys.count
    }

    override var description: String {
        var result = "BinaryMap [\n"

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