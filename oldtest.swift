func testMap(lm: BinaryMap<String, Int>) {
    lm["fred"] = 72
    lm["phil"] = 47
    lm["kate"] = 91
    lm["ann"] = 68
    lm["frodo"] = 92
    print(lm)
    print("frodo is...\(String(describing: lm["frodo"]))")
    print("ann is...\(String(describing: lm["ann"]))")
    lm.remove("frodo")
    lm.remove("ann")
    print(lm)
    print(lm.count)
}

// testMap(lm: BinaryMap<String, Int>())


print ("testing hashmap")
func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

var hm = HashMap<String, String>(initialArraySize: 20)
// var hm = BinaryMap<Int, String>()
var storage = [String: String]()

for _ in 0..<20 {
    let key = randomString(length: 10)
    let value = randomString(length: 10)
    hm[key] = value
    storage[key] = value
}

print("------------ STARTING GETS -------------------")

for (key, value) in storage {
    if hm[key] != value {
        print("error found!")
    }
}

print("number collisions", hm.getNumberCollisions())