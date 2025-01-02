class MedianTwoArrays_4 {
    static let nums1 = [1,2]
    static let nums2 = [3,4,5]
    //使用.sorted方法排序
    static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var numsAll = (nums1+nums2)
        numsAll = numsAll.sorted()
        print(numsAll)
        let count = numsAll.count
        let index1 = count / 2 - 1
        if count%2 == 0 {
            return Double(Double(numsAll[index1]+numsAll[index1+1])/2)
        } else {
            return Double(numsAll[index1+1])
        }
    }
}