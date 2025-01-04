class MedianTwoArrays_4 {
    static let nums1: [Int] = [2,3,4,5]
    static let nums2 = [1]
    //MARK: 使用.sorted方法排序
    // static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    //     var numsAll = (nums1+nums2)
    //     numsAll = numsAll.sorted()
    //     print(numsAll)
    //     let count = numsAll.count
    //     let index1 = count / 2 - 1
    //     if count%2 == 0 {
    //         return Double(Double(numsAll[index1]+numsAll[index1+1])/2)
    //     } else {
    //         return Double(numsAll[index1+1])
    //     }
    // }

    //MARK: 手动排序(O(m+n))
    // static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    //     var index1 = 0
    //     var index2 = 0
    //     var numsAll: [Int] = []
    //     var number1: Int
    //     var number2: Int
    //     while index1 < nums1.count && index2 < nums2.count {
    //         number1 = nums1[index1]
    //         number2 = nums2[index2]
    //         if number1 <= number2 {
    //             numsAll.append(number1)
    //             index1 += 1
    //         } else {
    //             numsAll.append(number2)
    //             index2 += 1
    //         }
    //     }
    //     if index1 == nums1.count {
    //         for i in index2..<nums2.count {
    //             numsAll.append(nums2[i])
    //         }
    //     } else {
    //         for i in index1..<nums1.count {
    //             numsAll.append(nums1[i])
    //         }
    //     }
    //     print(numsAll)
    //     let count = numsAll.count
    //     let indexleft = count / 2 - 1
    //     if count % 2 == 0 {
    //         return Double(Double(numsAll[indexleft]+numsAll[indexleft+1]) / 2)
    //     } else {
    //         return Double(numsAll[indexleft+1])
    //     }
    // }

    //MARK: 二分查找
    //核心: 寻找第k小的数字, 在两个数组中分别取前k/2的截断位置, 进行比较, 丢弃小的部分(第k小的数字不会在其中), 更新k值(减去丢弃的部分)
    static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let numbers = self.findMedianTwoNumbers(nums1: nums1, nums2: nums2)
        return (Double(numbers.0 + numbers.1) / 2.0)
    }

    static private func findMedianTwoNumbers(nums1: [Int], nums2: [Int]) -> (Int, Int) {
        let countAll = nums1.count + nums2.count
        //第k小的数
        var k: Int
        //当数组有偶数个元素时, 第k+1小的数
        var kPlus: Int?
        if countAll % 2 == 0 {
            k = countAll / 2
            kPlus = k + 1
        } else {
            k = countAll / 2 + 1
            kPlus = nil
        }
        if nums1.isEmpty {
            if kPlus == nil {
                return (nums2[k-1], nums2[k-1])
            } else {
                return (nums2[k-1], nums2[kPlus!-1])
            }
        } else if nums2.isEmpty{
            if kPlus == nil {
                return (nums1[k-1], nums1[k-1])
            } else {
                return (nums1[k-1], nums1[kPlus!-1])
            }
        }
        if nums1.count == 1 && nums2.count == 1 {
            return (nums1[0],nums2[0])
        }
        var k1 = min(k/2, nums1.count)
        var k2 = k - k1
        if k2 > nums2.count {
            k2 = nums2.count
            k1 = k - k2
        }
        var indexBase1 = 0
        var indexBase2 = 0
        while true {
            //print(k,k1,k2,indexBase1,indexBase2,terminator: "->")
            if nums1[indexBase1+k1-1] <= nums2[indexBase2+k2-1] {
                indexBase1 += k1
                k = k - k1
            } else {
                indexBase2 += k2
                k = k - k2
            }
            //返回
            if indexBase1 == nums1.count {
                if kPlus == nil {
                    return(nums2[indexBase2+k-1],nums2[indexBase2+k-1])
                } else {
                    return(nums2[indexBase2+k-1],nums2[indexBase2+k])
                }
            } else if indexBase2 == nums2.count {
                if kPlus == nil {
                    return(nums1[indexBase1+k-1],nums1[indexBase1+k-1])
                } else {
                    return(nums1[indexBase1+k-1],nums1[indexBase1+k])
                }
            }
            if k == 1 {
                let minNumber = min(nums1[indexBase1],nums2[indexBase2])
                if kPlus == nil {
                    return(minNumber,minNumber)
                } else {
                    if minNumber == nums1[indexBase1] {
                        if indexBase1+1 <= nums1.count-1 {
                            let minNumber2nd = min(nums1[indexBase1+1],nums2[indexBase2])
                            return (minNumber, minNumber2nd)
                        } else {
                            return (minNumber, nums2[indexBase2])
                        }
                    } else {
                        if indexBase2+1 <= nums2.count-1 {
                            let minNumber2nd = min(nums2[indexBase2+1],nums1[indexBase1])
                            return (minNumber, minNumber2nd)
                        } else {
                            return (minNumber, nums1[indexBase1])
                        }
                    }
                }
            }
            k1 = min(k/2, nums1.count-indexBase1)
            k2 = k - k1
            if k2 > nums2.count-indexBase2 {
                k2 = min(k/2, nums2.count-indexBase2)
                k1 = k - k2
            }
            //print(k,k1,k2,indexBase1+k1-1,indexBase2+k2-1)
        }
    }
}