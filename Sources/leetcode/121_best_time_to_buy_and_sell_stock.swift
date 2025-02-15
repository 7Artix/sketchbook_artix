class Solution_121 {
    static let prices = [7,1,5,3,6,4]
    static func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
        for price in prices {
            minPrice = min(price, minPrice)
            maxProfit = max(maxProfit, price - minPrice)
        }
        return maxProfit
    }
}