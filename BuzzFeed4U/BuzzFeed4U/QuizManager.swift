import Foundation


class QuizManager {
    
    static let shared = QuizManager()
    private init () {}
    
    var selectedStaringCategory: Category?
    var selectedCharacter: Character?
    var selectedOptions: [Option] = []
    
    var questions: [Question] = []
    var results: [Result] = []
    
    
    var currentQuestion = 0
    
    func handleOptionSelected(at index: Int) {
        defer { goToNextQuestion() }
        if currentQuestion == 0 {
            selectedCharacter = Character(rawValue: index)
            return
        }
        
        let currentQuestion = questions[currentQuestion]
        let selectedOption = currentQuestion.options[index]
        selectedOptions.append(selectedOption)
    }
    
    func goToNextQuestion() {
        currentQuestion += 1
    }
    
    func getResult() -> String? {
        let index: Int
        
        switch selectedCharacter {
        case .ariel:
            index = 0
        case .mulan:
            index =  1
        case .snowWhite:
            index =  2
        case .none:
            return nil
        }
        
        let option = selectedOptions[index]
        for result in results {
            if result.category == option.category {
                return result.buzzfeedUrl
            }
        }
        return nil
    }
}
