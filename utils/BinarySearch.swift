import Foundation

/*

[0, 1, 2, 3, 4]   // count = 5
       ^
       2 = midindex


[0, 1, 2, 3, 4, 5] // count = 6
          ^
          3 = midindex

when searching top half:

[0, 1, 2] | [3, 4, 5] // count = 6
             ^
             3 = midindex
search for 4 in top half would return 1
should return 4

*/

// overload to allow using both arrays and array slices
func binarySearch<K: Comparable>(elements: [K], target: K) -> (inArray: Bool, index: Int) {
   return binarySearch(elements: elements[...], target: target)
}

func binarySearch<K: Comparable>(elements: ArraySlice<K>, target: K, indexOffset: Int = 0) -> (inArray: Bool, index: Int) {
    // catch to make sure we don't sort empty lists
    if elements.count == 0 {
        return (
            inArray: false,
            index: indexOffset
        )
    }
    
    // this will round down if odd
    let midIndex = Int(elements.count / 2) + indexOffset

    let midElement = elements[midIndex]

    // last run
    if elements.count == 1 {
        // on the last run, we either find the element
        // OR we recommend a place to insert it in the list
        if midElement == target {
            // if the element IS the target
            return (
                inArray: true,
                index: midIndex
            )
        } else if target < midElement {
            // when the element is greater than the target, push the list over
            return (
                inArray: false,
                index: midIndex
            )
        } else {
            // when the element is less than the target, insert it after
            return (
                inArray: false,
                index: midIndex + 1
            )
        }
    }

    // if the element is greater than the target (bottom half)
    if target < midElement {
        return binarySearch(elements: elements[..<midIndex], target: target, indexOffset: indexOffset)
    }
    // if the element is less than the target (top half)
    else {
        return binarySearch(elements: elements[midIndex...], target: target, indexOffset: midIndex)
    }
}