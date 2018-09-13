let parseA = characterParser(for: "A")
let parseB = characterParser(for: "B")

run(parseA, on: "ABC")
run(parseA, on: "ZBC")
run(parseA, on: "")

let parseAB = parseA.followed(by: parseB)

run(parseAB, on: "ABC")
run(parseAB, on: "ZBC")
run(parseAB, on: "AZC")
run(parseAB, on: "")

let parseAorB = parseA.or(parseB)

run(parseAorB, on: "ABC")
run(parseAorB, on: "ZBC")
run(parseAorB, on: "BZD")
run(parseAorB, on: "")

let parseZ = parseA.map{char in return "Z" as Character}

run(parseZ, on: "ABC")
run(parseZ, on: "ZBC")
run(parseZ, on: "")


