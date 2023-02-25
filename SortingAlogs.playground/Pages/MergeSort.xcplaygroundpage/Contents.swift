import Foundation

/*
 Merge Sort
 Thought process: keep deviding the given list to individual lists and kept merging them one by one. for example list [1, 3, 2, 4, 5] is recursively devided and merged as described below
 
 merging: list 1: [1], list2: [3]
 merging: list 1: [4], list2: [5]
 merging: list 1: [2], list2: [4, 5]
 merging: list 1: [1, 3], list2: [2, 4, 5]
 Sorted List: [1, 2, 3, 4, 5]
 
 */

/// Function to  merge two sorted lists
/// - Parameters:
///   - list1: first sorted list
///   - list2: second sorted list
/// - Returns: return combined sorted list from first and second
func merge(list1: [Int], list2: [Int]) -> [Int] {
    
    print("merging: list 1: \(list1), list2: \(list2)\n")
    var resultedList = [Int]()
    var i = 0, j = 0
    
    while i < list1.count && j < list2.count {
        if list1[i] < list2[j] {
            resultedList.append(list1[i])
            i += 1
        } else {
            resultedList.append(list2[j])
            j += 1
        }
    }
    
    while i < list1.count {
        resultedList.append(list1[i])
        i += 1
    }

    while j < list2.count {
        resultedList.append(list2[j])
        j += 1
    }
    return resultedList
}

///  Function to devide a list into sublists
/// - Parameter list: given list to sort
/// - Returns: provides a sorted list
func mergeSort(_ list: [Int]) -> [Int] {
    
    // Keep deviding recursively until individual elements are in lists kept on start merging them
    if list.count <= 1 {
        return list
    }
    
    let left = mergeSort(Array(list[0..<list.count/2]))
    let right = mergeSort(Array(list[list.count/2..<list.count]))
    return  merge(list1: left, list2: right)
}

print("Sorted List: \(mergeSort([1, 3, 2, 4, 5]))")

