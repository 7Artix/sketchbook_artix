// let result = Solution_33.search(Solution_33.nums, Solution_33.target)
// print(result)

let timeMap = TimeMap_981()
timeMap.set("foo", "bar", 1)
print(timeMap.memory)
print(timeMap.get("foo", 1))
print(timeMap.get("foo", 3))
timeMap.set("foo", "bar4", 4)
print(timeMap.memory)
print(timeMap.get("foo", 4))
print(timeMap.get("foo", 5))
timeMap.set("foo", "bar2", 2)
print(timeMap.memory)