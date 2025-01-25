class Solution_853 {
    static let target = 21
    static let position = [1,15,6,8,18,14,16,2,19,17,3,20,5]
    static let speed = [8,5,5,7,10,10,7,9,3,4,4,10,2]
    static func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var cars = zip(position,speed).map {($0, $1)}
        cars = cars.sorted {$0.0 > $1.0}
        print(cars)
        var countFleet = 0
        var ETAFront: Float = -1.0
        for positionCar in cars{
            let ETACurrent = Float(target - positionCar.0) / Float(positionCar.1)
            if ETACurrent > ETAFront {
                ETAFront = ETACurrent
                countFleet += 1
            }
        }
        return countFleet
    }
}