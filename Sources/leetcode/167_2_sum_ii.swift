class Solution_167 {
    static let numbers = [2,7,11,15]
    static let target = 9
    static func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var pointerLeft = 0
        var pointerRight = numbers.count - 1
        while (numbers[pointerLeft] + numbers[pointerRight]) != target {
            switch (numbers[pointerLeft] + numbers[pointerRight]) > target {
                case true:
                    pointerRight -= 1
                case false:
                    pointerLeft += 1
            }
        }
        return [pointerLeft+1, pointerRight+1]
    }
}