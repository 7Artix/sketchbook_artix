class ReverseInteger_7 {
    static let x = -123
    //时间复杂度O(N^2), 空间复杂度O(N)
    static func reverse(_ x: Int) -> Int {
        var digit = 1 //1->10->100
        var numbers: [Int] = []
        var numberReversed = 0
        while x / digit != 0 {
            numbers.append(x%(digit*10)/digit)
            digit *= 10
        }
        print(numbers)
        for (digit, number) in numbers.reversed().enumerated() {
            numberReversed += number * powArtix(base: 10, exponent: digit)
        }
        if numberReversed > Int32.max || numberReversed < Int32.min {
            return 0
        } else {
            return numberReversed
        }
    }
    //时间复杂度O(N^2), 空间复杂的O(1)
    static func powArtix(base: Int, exponent: Int) -> Int {
        var result = 1
        for _ in 0..<exponent {
            result *= base
        }
        return result
    }
}