struct Question {
    let questionTitle: String
    let options: [Option]
    let character: Character
}

struct Option {
    let option: String
    let category: Category
    let result: Result?
}

struct Result {
    let buzzfeedUrl: String
    let category: Category
    let imageName: String
    let title: String
    let subtitle: String
}

enum Category {
    case existentialCrisis
    case foodie
    case love
    case bored
    case none
}

enum Character: Int {
    case mulan
    case snowWhite
    case ariel
    case eeyeore
    case none
}

// Category Map:
// #1: identity crisis;
// #2: food
// #3: love
// #4: random
