import Foundation


class QuizManager {
    
    // MARK: - Inner types
    
    enum Repository {}
    
    // MARK: - Initialiazation
    
    static let shared = QuizManager()
    private init () {}
    
    // MARK: - Properties
    
    var selectedStartingCategory: Category?
    
    var selectedCharacter: Character?
    var selectedOptions: [Option] = []
    
    
    var questions = Repository.questions
    var results = Repository.questions.flatMap { $0.options }.map { $0.result }
    
    var currentQuestionIndex = 0
    
    // MARK: - State functions
    
    func isQuizDone() -> Bool {
        currentQuestionIndex >= questions.count
    }
    
    func getCurrentQuestion () -> Question {
        return questions[currentQuestionIndex]
    }
    
    func handleOptionSelected(at index: Int) {
        defer { goToNextQuestion() }
        
        if currentQuestionIndex == 0 {
            selectedCharacter = Character(rawValue: index)
            return
        }
        
        let currentQuestion = questions[currentQuestionIndex]
        let selectedOption = currentQuestion.options[index]
        selectedOptions.append(selectedOption)
        print("GUARDEI")
    }
    
    func goToNextQuestion() {
        currentQuestionIndex += 1
    }
    
    func selectedCategoryResult() -> Result? {
        return results
            .filter { $0?.category == selectedStartingCategory }
            .randomElement() ?? nil
    }
    
    func getQuizResult() -> Result? {
        guard let questionIndex = questions.firstIndex(where: { $0.character == selectedCharacter })
        else { return nil }
        let selectedOption = selectedOptions[questionIndex - 1]
        return selectedOption.result
    }
    
    func getResults() -> [Result] {
        var results: [Result] = []
        
        guard let selectedStartingCategoryResult = selectedCategoryResult(),
              let quizResult = getQuizResult()
        else { return [] }

        results.append(selectedStartingCategoryResult)
        results.append(quizResult)
        
        return results
        
    }
}

extension Category {
    func headline() -> String {
        let base: (String) -> String = { "O quiz do BuzzFeed perfeito para resolver \($0) é:" }
        switch self {
        case .bored:
            return base("seu tédio")
        case .existentialCrisis:
            return base("sua crise existencial")
        case .foodie:
            return base("sua necessidade por comida e bebida")
        case .love:
            return base("sua vida amorosa")
        case .none:
            fatalError("Eita")
        }
    }
}
