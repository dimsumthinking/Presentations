let intGenerator = Rand<Int>{rng in rng.next()}

let (int1, intRNG1) =  intGenerator.run(initialRNG)
int1
let (int2, intRNG2) = intGenerator.run(intRNG1)
int2

let boolGenerator: Rand<Bool> = intGenerator.map {int in int % 2 == 1}

let (bool1, boolRNG1) =  boolGenerator.run(initialRNG)
bool1
let (bool2, boolRNG2) = boolGenerator.run(boolRNG1)
bool2

let doubleGenerator: Rand<Double> = intGenerator.map {int in Double(int)/Double(max)}

let (double1, doubleRNG1) =  doubleGenerator.run(initialRNG)
double1
let (double2, doubleRNG2) = doubleGenerator.run(doubleRNG1)
double2

let lessThan1000: Rand<Int> = intGenerator.nextLessThan(1000)

let (nextLessThan1000, ltRNG1) = lessThan1000.run(initialRNG)
nextLessThan1000

let next100 = intGenerator.next(100)

let (result100, nextRNG) = next100.run(initialRNG)
result100
