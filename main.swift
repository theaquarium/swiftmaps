public class MapTest {
    var stringList = [String]()
    let chars = Array("abcdefghijklmnopqrstuvwxyz")
    let NUMBER_PUTS = 1000

    func getRandomInt(range: Int) -> Int {
        return Int.random(in: 0..<range)
    }

    func makeString(length: Int) -> String {
        var s = ""
        let numberChars = chars.count
        for _ in 0..<length {
            s.append(chars[getRandomInt(range: numberChars)])
        }
        return s
    }

    func makeStringList(size: Int) {
        stringList = [String]()
        for _ in 0..<size {
            stringList.append(makeString(length: 10))
        }
    }

    func testLinearMap() -> Bool {
        var value = ""
        var key = ""
        let map = LinearMap<String, String>()
        for i in 0..<NUMBER_PUTS {
            map.set(stringList[i], v: stringList[i])
        }
        for index in 0..<NUMBER_PUTS {
            key = stringList[index]
            value = map.get(key)!
            if !(value == key) {
                return false
            }
        }
        return true
    }

    func testBinaryMap() -> Bool {
        var value = ""
        var key = ""
        let map = BinaryMap<String, String>()
        for i in 0..<NUMBER_PUTS {
            map.set(stringList[i], v: stringList[i])
        }
        for index in 0..<NUMBER_PUTS {
            key = stringList[index]
            value = map.get(key)!
            if !(value == key) {
                return false
            }
        }
        return true
    }

    func testHashMap() -> Bool {
        var value = ""
        var key = ""
        let map = HashMap<String, String>(initialArraySize: NUMBER_PUTS * 2)
        for i in 0..<NUMBER_PUTS {
            map.set(stringList[i], v: stringList[i])
        }
        for index in 0..<NUMBER_PUTS {
            key = stringList[index]
            value = map.get(key)!
            if !(value == key) {
                return false
            }
        }
        print("Collisions: \(map.getNumberCollisions())")
        return true
    }

    func testGenericMap(_ map: Map<String, String>) -> Bool {
        var value = ""
        var key = ""
        for i in 0..<NUMBER_PUTS {
            map.set(stringList[i], v: stringList[i])
        }
        for index in 0..<NUMBER_PUTS {
            key = stringList[index]
            value = map.get(key)!
            if !(value == key) {
                return false
            }
        }

        /*for (key, value) in map {
            print("\(key): \(value)")
        }

        print(map)*/
        
        return true
    }

    func doTest() {
        makeStringList(size: NUMBER_PUTS)
        print("Linear Map: \(testLinearMap())")
        print("Binary Map: \(testBinaryMap())")
        print("Hash Map: \(testHashMap())")
        print("Generic Map (linear): \(testGenericMap(LinearMap<String, String>()))")
        print("Generic Map (binary): \(testGenericMap(BinaryMap<String, String>()))")
        print("Generic Map (hash): \(testGenericMap(HashMap<String, String>(initialArraySize: NUMBER_PUTS * 2)))")

    }
}

var mt = MapTest()
mt.doTest()