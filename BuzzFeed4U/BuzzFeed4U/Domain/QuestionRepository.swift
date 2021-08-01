extension QuizManager.Repository {
    static let questions: [Question] = [
        Question(
            questionTitle: "Qual personagem Disney te representa?",
            options: [
                Option(
                    option: "Mulan",
                    category: .none,
                    result: nil
                ),
                Option(option: "Branca de Neve",
                       category: .none, result: nil),
                Option(option: "Ariel",
                       category: .none, result: nil),
                Option(
                    option: "Burro do ursinho Pooh. Digo, o burro do desenho do ursinho Pooh. Quer dizer, o personagem Burro.",
                    category: .none,
                    result: nil
                ),
             ],
             character: .none
        ),

        Question(
            questionTitle: "Como você gostaria de ser reconhecido(a) pela sociedade?",
            options: [
                Option(
                    option: "Sendo o ex-bb de um ex-bbb",
                    category: .existentialCrisis,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/que-tipo-de-subcelebridade-voce-seria",
                        category: .existentialCrisis,
                        imageName: "subcelebrity",
                        title: "Que tipo de subcelebridade você seria?",
                        subtitle: "Independente do resultado, o que importa é aparecer."
                )),
                
                Option(
                    option: "Participante de um reality show culinário",
                    category: .foodie,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/teste-monte-refeicao-basiquinha-diremos-jurado-masterchef",
                        category: .foodie,
                        imageName: "masterchef",
                        title: "Monte um almoço e diremos qual jurado do Masterchef você é",
                        subtitle: "Vai uma saladinha?"
                )),
                
                Option(
                    option: "Mozão de um famoso dos anos 90",
                    category: .love,
                    result: Result(
                        buzzfeedUrl: "Vamos descobrir qual crush dos anos 90 é seu par perfeito",
                        category: .love,
                        imageName: "90sCelebrityCrush",
                        title: "Vamos descobrir qual crush dos anos 90 é seu par perfeito",
                        subtitle: "Não se faz mais homens como antigamente."
                )),
                
                Option(
                    option: "Ser o melhor ship da Selena Gomez",
                    category: .bored,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/qual-quadro-do-faustao-mais-combina-com-voce",
                        category: .bored,
                        imageName: "faustao",
                        title: "Qual quadro icônico do 'Domingão do Faustão' é você?",
                        subtitle: "Videocassetadas, Se Vira nos 30, Dança dos Famosos... Só quem viveu sabe."
                )),
             ],
             character: .mulan
        ),

        Question(
            questionTitle: "O que te impede de alcançar seus sonhos?",
            options: [
                Option(
                    option: "Meus amigos não respondem meus stories",
                    category: .existentialCrisis,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/estas-7-perguntas-vao-dizer-se-seus-amigos-te-odeiam-ou-se-voce-so-precisa-ir-dormir",
                        category: .existentialCrisis,
                        imageName: "friendsHateU",
                        title: "Estas 7 perguntas vão dizer se seus amigos te odeiam ou se você só precisa ir dormir",
                       subtitle: "\"Eu preciso que todos gostem de mim, toda hora, todo dia.\""
                )),
                
                Option(
                    option: "Gasto toda minha grana em vinho",
                    category: .foodie,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/qual-tipo-de-sommelier-voce-e",
                        category: .foodie,
                        imageName: "sommelier",
                        title: "Qual tipo de sommelier você é?",
                        subtitle: "\"Hm, esta fofoca tem um tanino aveludado.\""
                )),
                
                Option(
                    option: "Eu namoro um serial killer",
                    category: .love,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/filme-terror-representa-vida-amorosa",
                        category: .love,
                        imageName: "horrorMovie",
                        title: "Qual título de filme de terror representa sua vida amorosa?",
                        subtitle: "\"O Sexto Sentido\" pra quem tem o dom de reconhecer furadas."
                )),
                
                Option(
                    option: "Eu sempre durmo depois do despertador",
                    category: .bored,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/julgue-estes-relogios-e-diremos-se-voce-e-uma-pessoa-atrasada",
                        category: .bored,
                        imageName: "latePerson",
                        title: "Julgue estes relógios e diremos se você é uma pessoa atrasada",
                        subtitle: "Isso são horas de fazer este teste?"
                )),
             ],
             character: .snowWhite
        ),

        Question(
            questionTitle: "Por que você não namora?",
            options: [
                Option(
                    option: "Porque sou obcecado(a) pela Xuxa",
                    category: .existentialCrisis,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/quem-voce-seria-na-noite-das-mil-xuxas",
                        category: .existentialCrisis,
                        imageName: "xuxa",
                        title: "Qual look icônico da Xuxa você seria?",
                        subtitle: "Nheco, nheco, xique, xique, balancê."
                )),
                
                Option(
                    option: "Não acho match compatível com meu mapa astral",
                    category: .foodie,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/parece-estranho-mas-vamos-revelar-seu-signo-de-acordo-com-suas-sobremesas-favoritas",
                        category: .foodie,
                        imageName: "favoriteDessert",
                        title: "Parece estranho, mas vamos revelar seu signo de acordo com suas sobremesas favoritas",
                        subtitle: "Bolo red velvet é muito áries."
                )),
                
                Option(
                    option: "Tenho trauma por causa do(a) ex",
                    category: .love,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/qual-tipo-de-ex-voce-nao-aguenta-mais-na-sua-vida",
                        category: .love,
                        imageName: "exes",
                        title: "Qual tipo de ex você não aguenta mais na sua vida?",
                        subtitle: "Ex-gado, ex-mozão..."
                )),
                
                Option(
                    option: "Porque eu faço muita piada de Shrek nos dates",
                    category: .bored,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/so-quem-assiste-shrek-uma-vez-por-ano-vai-passar-neste-teste",
                        category: .bored,
                        imageName: "shrek",
                        title: "Só quem assiste Shrek uma vez por ano vai passar neste teste",
                        subtitle: "Dublado, lógico."
                )),
            ],
            character: .ariel
        ),

        Question(
            questionTitle: "O que você faz quando sente que não se conhece?",
            options: [
                
                Option(
                    option: "sou cult, consumo arte",
                    category: .existentialCrisis,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/as-coisas-para-onde-seu-olhar-e-atraido-nestas-pinturas-revela-uma-verdade-profunda-sobre-voce",
                        category: .existentialCrisis,
                        imageName: "paintings",
                        title: "As coisas que atraírem seu olhar nestas pinturas revelarão uma verdade profunda sobre você",
                        subtitle: "É hora de ficar surreal!"
                )),
                
                Option(
                    option: "Cozinho um miojão",
                    category: .foodie,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/qual-sabor-de-miojo-voce-e",
                        category: .foodie,
                        imageName: "noodles",
                        title: "Qual sabor de miojo você é?",
                        subtitle: "Duvido você terminar esse teste sem ficar com vontade de comer um miojinho."
                )),
                
                Option(
                    option: "Vejo memes na internet",
                    category: .love,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/qual-meme-representa-sua-vida-amorosa-em-2021",
                        category: .love,
                        imageName: "loveLifeMeme",
                        title: "Qual meme representa sua vida amorosa em 2021?",
                        subtitle: "Como disse Pabllo: ama, sofre, chora."
                )),
                
                Option(
                    option: "Brinco na neve, tipo a irmã da Frozen",
                    category: .bored,
                    result: Result(
                        buzzfeedUrl: "https://buzzfeed.com.br/quiz/qual-boneco-de-neve-brasileiro-te-representa",
                        category: .bored,
                        imageName: "snowMan",
                        title: "Qual boneco de neve brasileiro te representa?",
                        subtitle: "Nem todo mundo nasceu pra ser Olaf."
                )),
            ],
            character: .eeyeore
        ),
    ]
}
