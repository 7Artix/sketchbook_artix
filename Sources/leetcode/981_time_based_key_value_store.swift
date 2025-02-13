class TimeMap_981 {
    var memory = [String: [(Int, String)]]()
    init() {}
    func setAnyTime(_ key: String, _ value: String, _ timestamp: Int) {
        var arrayValues = self.memory[key]
        if arrayValues == nil {
            self.memory[key] = [(timestamp, value)]
        } else {
            var pointerLeft = 0
            var pointerRight = arrayValues!.count - 1
            while pointerLeft <= pointerRight {
                let pointerMid = pointerLeft + (pointerRight - pointerLeft) / 2
                if arrayValues![pointerMid].0 == timestamp {
                    return
                } else if arrayValues![pointerMid].0 < timestamp {
                    pointerLeft = pointerMid + 1
                } else {
                    pointerRight = pointerMid - 1
                }
            }
            arrayValues!.insert((timestamp,value), at: pointerLeft)
            self.memory[key] = arrayValues
        }
    }
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        guard var arrayValues = self.memory[key] else {
            self.memory[key] = [(timestamp, value)]
            return
        }
        arrayValues.append((timestamp, value))
        self.memory[key] = arrayValues
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        guard let arrayValues = self.memory[key] else { return "" }
        var pointerLeft = 0
        var pointerRight = arrayValues.count - 1
        while pointerLeft <= pointerRight {
            let pointerMid = pointerLeft + (pointerRight - pointerLeft) / 2
            if arrayValues[pointerMid].0 == timestamp {
                return arrayValues[pointerMid].1
            } else if arrayValues[pointerMid].0 < timestamp {
                pointerLeft = pointerMid + 1
            } else {
                pointerRight = pointerMid - 1
            }
        }
        if pointerRight < 0 {
            return ""
        }
        return arrayValues[pointerRight].1
    }
}