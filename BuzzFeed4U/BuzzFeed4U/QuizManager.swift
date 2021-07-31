import Foundation


class QuizManager {
    
    static let shared = QuizManager()
    private init () {}
    
    var selectedStaringCategory: Category?
    
    var selectedCharacter: Character?
    var selectedOptions: [Option] = []
    
    var questions: [Question] = [
        Question(questionTitle: "Qual personagem Disney te representa?",
             options: [
                Option(option: "Mulan", category: .none),
                Option(option: "Branca de Neve",
                       category: .none),
                Option(option: "Ariel",
                       category: .none),
                Option(option: "Burro do ursinho Pooh. Digo, o burro do desenho do ursinho Pooh. Quer dizer, o personagem Burro.", category: .none)
             ],
             character: .none
        ),
        Question(questionTitle: "Como você gostaria de ser reconhecido(a) pela sociedade?",
             options: [
                Option(option: "Sendo o ex-bb de um ex-bbb", category: .existentialCrisis),
                Option(option: "Participante de um reality show culinário",
                       category: .foodie),
                Option(option: "Mozão de um famoso dos anos 90",
                       category: .love),
                Option(option: "Ser o melhor ship da Selena Gomez", category: .bored)
             ],
             character: .mulan
        ),
        Question(questionTitle: "O que te impede de alcançar seus sonhos?",
             options: [
                Option(option: "Meus amigos não respondem meus stories", category: .existentialCrisis),
                Option(option: "eu gasto todo meu dinheiro com vinho",
                       category: .foodie),
                Option(option: "Eu namoro um serial killer",
                       category: .love),
                Option(option: "Eu sempre durmo depois do despertador", category: .bored)
             ],
             character: .snowWhite
        ),
        Question(questionTitle: "Por que você não namora?",
             options: [
                Option(option: "Porque sou obcecado(a) pela Xuxa", category: .existentialCrisis),
                Option(option: "Não acho match compatível com meu mapa astral",
                       category: .foodie),
                Option(option: "Tenho trauma por causa do(a) ex",
                       category: .love),
                Option(option: "Porque eu faço muita piada de Shrek nos dates", category: .bored)
             ],
             character: .ariel
        ),
        Question(questionTitle: "O que você faz quando sente que não se conhece?",
             options: [
                Option(option: "sou cult, consumo arte", category: .existentialCrisis),
                Option(option: "Cozinho um miojão",
                       category: .foodie),
                Option(option: "Vejo memes na internet",
                       category: .love),
                Option(option: "Brinco na neve, tipo a irmã da Frozen", category: .bored)
             ],
             character: .eeyeore
        )
    ]
    
    var results: [Result] = []
    
    var currentQuestionIndex = 0
    
    func isQuizDone() -> Bool {
        currentQuestionIndex >= questions.count - 1
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
    }
    
    func goToNextQuestion() {
        currentQuestionIndex += 1
    }
    
//    func getResult() -> String? {
//        questions
//            .first { $0.character == selectedCharacter }?
//
//    }
}
