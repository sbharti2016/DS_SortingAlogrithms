
import Foundation

// Quick Sort Implementation

/*
 1. Logical Sorting Algorithm means we are not creating sub lists but swapping elements at given indexes.
 2. Utlize devide and conquer approach recursively
 
 IDEA: if we pick any element in the colletion and able to find out its location means all the elements to the left will be smaller and to the right will be greater we can say that element is sorted in that list and if we apply the same principal to all the elements one by one we can say the list is sorted.
 
 Note: In below example we are considering last element of list as `pivot`
 */

// Without logging version

/// Find location of selected element in the given list
/// - Parameters:
///   - low: started index of the list to sort
///   - high: end index of the list to sort
///   - list: list to be sorted
/// - Returns: return location of the selected element in the list
func findLocationOfPivot(low: Int, high: Int, list: inout [Int]) -> Int {
    // Starting i from -1 because there can be situation when element is smaller than all the elements present in list.
    var i = low - 1, j = low, pivot = list[high - 1]
    while (high-1 > j) {
        if pivot > list[j] {
            i += 1
            if i != j {
                list.swapAt(i, j)
            }
        }
        j += 1
    }
    list.swapAt(i+1, high - 1)
    return i+1
}

/// Quick sort algorithm implementation
/// - Parameters:
///   - low: started index of the list to sort
///   - high: end index of the list to sort
///   - list: list to be sorted
func quickSort(low: Int, high: Int, list: inout [Int]) {
    if high - low <= 1 { return }
    
    let pivotLocation = findLocationOfPivot(low: low, high: high, list: &list)
    quickSort(low: low, high: pivotLocation, list: &list)
    quickSort(low: pivotLocation, high: high, list: &list)
}

/*
 
 Note: Logging version of the same above code. Please comment above methods before running this code else there will be compile time errors.
 
func findLocationOfPivot(low: Int, high: Int, list: inout [Int]) -> Int {
    
    print("\n\nCurrent list to sort: ", list[low ..< high])
    print("low: \(low), high: \(high), pivot: \(list[high - 1])")

    var i = low - 1, j = low, pivot = list[high - 1]
    
    print("While loop started")
    while (high-1 > j) {
        print("i = \(i), j = \(j)")
        print("Checking: \(pivot) > \(list[j]) = \(pivot > list[j])")
        if pivot > list[j] {
            print("Increment i by 1, New value of i = \(i) + 1 = \(i + 1)")
            i += 1
            // if index i and j has same locations, there is no need of swapping.
            if i != j {
                list.swapAt(i, j)
                print("Swapped index \(i) & \(j). Updated list = \(list)")
            }
        }
        j += 1
    }
    print("While loop ended")
    list.swapAt(i+1, high - 1)
    print("Sorted List for pivot: \(pivot): ", list, separator: "", terminator: " :: ")
    print("Current Pivot Location: ", i+1)
    return i+1
}

// Note:- This function is not in use, currently utilizing `Foundation's` swap function
func swap(index1: Int, index2: Int, list: inout [Int]) {
    print("Before Swapping list: \(list)")
    let temp = list[index1]
    list[index1] = list[index2]
    list[index2] = temp
    print("Swapping of: \(index1) with \(index2), result: \(list)")
}

func quickSort(low: Int, high: Int, list: inout [Int]) {
    // if there is one element then return
    if high - low <= 1 { return }
    
    let pivotLocation = findLocationOfPivot(low: low, high: high, list: &list)
    quickSort(low: low, high: pivotLocation, list: &list)
    quickSort(low: pivotLocation, high: high, list: &list)
}

var listToSort = [1, 3, 4, 0, 2, 8, 6, 5, 7]
quickSort(low: 0, high: listToSort.count, list: &listToSort)

print("Final list: ", listToSort)
*/


// Testing
var listToSort = [1, 3, 4, 0, 2, 8, 6, 5, 7]
print("Given list: ", listToSort)
quickSort(low: 0, high: listToSort.count, list: &listToSort)
print("Final list: ", listToSort)






