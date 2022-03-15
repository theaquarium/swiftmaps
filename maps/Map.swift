class Map<K: Hashable & Comparable, V>: Sequence, CustomStringConvertible {
    var count: Int { return 0 }

    func set(_ k: K, _ v: V) {}

    // this is truly the innovation that modern programming languages allow us
    // overloads are a beautiful thing
    // anyway this just makes it so that test codes works fine without modification
    // by allowing you to specify the v argument label
    func set(_ k: K, v: V) {
        set(k, v)
    }

    func remove(_ k: K) {}

    func get(_ k: K) -> V? {return nil}

    var description: String { return "WARNING: this is an abstract map" }

    subscript(index: K) -> V? {
        get {
            return get(index)
        }

        set(newValue) {
            if let newValueSafe = newValue {
                set(index, newValueSafe)
            }
        }
    }

    func makeIterator() -> MapIterator<K, V> {
        return MapIterator([], [])
    }
}