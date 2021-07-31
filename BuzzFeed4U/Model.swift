struct Question {
    let questionTitle: String
    let options: [Option]
}

struct Option {
    let option: String
    let category: Category
}

struct Result {
    let buzzfeedUrl: String
    let category: Category
}

enum Category {
    case existentialCrisis
    case foodie
    case love
    case bored
}

enum Character: Int {
    case mulan, ariel, snowWhite
}

// Category Map:
// #1: identity crisis;
// #2: food
// #3: love
// #4: random
