#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/fontawesome:0.1.0": *
#import "@preview/ctheorems:1.1.2": *
#import "@preview/numbly:0.1.0": numbly

// Pdfpc configuration
// typst query --root . ./example.typ --field value --one "<pdfpc-file>" > ./example.pdfpc
#let pdfpc-config = pdfpc.config(
    duration-minutes: 30,
    start-time: datetime(hour: 14, minute: 10, second: 0),
    end-time: datetime(hour: 14, minute: 40, second: 0),
    last-minutes: 5,
    note-font-size: 12,
    disable-markdown: false,
    default-transition: (
      type: "push",
      duration-seconds: 2,
      angle: ltr,
      alignment: "vertical",
      direction: "inward",
    ),
  )

// Theorems configuration by ctheorems
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.author + ", " + self.info.institution + " - " + self.info.date,
  config-common(
    // handout: true,
    preamble: pdfpc-config, 
  ),
  config-info(
    title: [Il Linguaggio come Espressione dell'Intelligenza Artificiale],
    subtitle: [Il Ruolo e le Applicazioni dei Large Language Models nella Vita Quotidiana],
    author: [Gianluca Aguzzi],
    date: datetime.today().display("[day] [month repr:long] [year]"),
    institution: [Università di Bologna],
    // logo: emoji.school,
  ),
)

#set text(font: "Fira Sans", weight: "light", size: 18pt)
#show math.equation: set text(font: "Fira Math")

#title-slide()

== Chi Sono?
#align(top + center)[
  #let photo=image("figures/myself.jpeg")
  #box(
    photo,
    stroke: 2pt + black,
    height: 150pt,
    radius:100%,
    clip:true,
  )
]

- Ricercatore all'Università di Bologna
  - *Temi*: Intellingenza Artificiale Collettiva, Apprendimento Automatico (recentemente anche _Language Models_)
- Prof. a Contratto in Ingegneria E Scienze Informatiche
  - Corsi su Paradigmi di Programmazione (e apprendimento automatico)
- Per contatti: *gianluca.aguzzi\@unibo.it*

== Outline
=== Temi che verranno trattati#footnote[Alcune immagini e contenuti sono stati presi da #link("https://www.youtube.com/watch?v=LPZh9BOjkQs", "3Blue1Brown"), se volete approfondire vi consiglio di visitare il suo canale YouTube]:
- *Introduzione agli LLM*: Cosa sono, come funzionano e perché sono rivoluzionari
- *Applicazioni* degli LLM nella Vita quotidiana


= Introduzione

#focus-slide[
  = Large Language Models (LLMs)
  #align(center)[
    O _Modello Linguistico di Grande Dimensione_ è un *rete neurale artificiale* addestrata su _grandi quantità di dati testuali_ per _comprendere_ e *generare* testo in modo sempre più naturale e contestuale.
  ]
  #align(left)[
  #pause
  - Ok, ma: 🙃 
    #pause
    - _Cos'è una rete neurale artificiale?_ 🤔
    #pause
    - _Come riesce a "comprendere" e "generare" testo?_ 🤔
  ]

]

== Rete Neurale Artificiale (Artificial Neural Network)
- *Rete Neurale* 🧠: modello computazionale ispirato al funzionamento del cervello umano
  - *Neuroni* 🧠: unità computazionale che riceve input e produce output
  - *Connessioni* 🧠: collegamenti tra neuroni che trasmettono segnali
  - *Strati* 🧠: insieme di neuroni collegati in modo sequenziale
#align(center)[
  #image("figures/artificiale-normale.png", width: 50%)
]
//- Questa struttura permette di *apprendere* da dati e *risolvere problemi* complessi
//  - Comprendere immagini, audio e testo 📸🔊📝

== Rete Neural Artificiale Profonda (Deep Neural Network) 
- *Rete Neurale Profonda* 🧠: rete neurale con *molti strati* di neuroni
  - *Strati Nascosti* 🧠: strati intermedi tra input e output
  - *Deep Learning* 🧠: tecnica di apprendimento automatico basata su reti neurali profonde
    - _Supervisionato_ #fa-arrow-right() #h(0.2em) Coppie di input-output etichettate (es. immagini con etichette)
    - _Non Supervisionato_ #fa-arrow-right() #h(0.2em) Dati non etichettati (es. immagini, testo) 
    - Le reti imparano ad estrarre *pattern* rilevanti dai dati senza bisogno di regole esplicite
#align(center)[
  #image("figures/deep-network.png", width: 50%)
]

== Perché Apprendere il Linguaggio è importante?
- Il Linguaggio è uno dei mezzi per esprimere la nostra intelligenza 🗣️
  - *Comunicazione*, *apprendimento*, *ragionamento* 🤔
  - Misurare l'intelligenza attraverso il linguaggio #fa-arrow-right() _Test di Turing_ 🤖

- Se un AI può comprendere e generare linguaggio, può:
  - Interagire con gli umani in modo più naturale 👥
  - Apprendere da testi e conversazioni 📚
  
  - Risolvere problemi complessi 🧠
#align(center)[
  #image("figures/idea-test-di-turing.jpg", width: 30%)
]

== Come - Generazione del testo
#image("figures/1.png")

== Come - Generazione del testo
#image("figures/2.png")

== Come - Generazione del testo
#image("figures/3.png")

== Come - Apprendimento
- Esempi di dati utilizzati: raccolti da web, libri, articoli, conversazioni
  - Miliardi di parole 📚 #fa-arrow-right() #h(0.2em) richiederebbero *2600* anni per essere lette da un umano!

#align(center)[
#image("figures/1-training.png", width: 60%)
]

== Come - Apprendimento
- Esempi di dati utilizzati: raccolti da web, libri, articoli, conversazioni
  - Miliardi di parole 📚 #fa-arrow-right() #h(0.2em) richiederebbero *2600* anni per essere lette da un umano!

#align(center)[
#image("figures/2-training.png", width: 60%)
]

== Come - Apprendimento
- Esempi di dati utilizzati: raccolti da web, libri, articoli, conversazioni
  - Miliardi di parole 📚 #fa-arrow-right() #h(0.2em) richiederebbero *2600* anni per essere lette da un umano!

#align(center)[
  #image("figures/training-3.png", width: 60%)
]

== Large, ma quanto?
#align(center)[
  #image("figures/llm-over-years.png")
]

== Large, ma quanto?
#align(center)[
  #image("figures/llm-size.png")
]

== LLM Perché? Capacità emergenti 
#align(center)[
  #image("figures/emergent.png")
]
== LLM Impatto
- Gli LLM ormai sono entrati nella nostra vita quotidiana 📱(pervasivi)
  - *Assistenti Virtuali* (Siri, Alexa, Google Assistant)
  - *Traduzione Automatica* (Google Translate)
  - *Ricerca e Filtraggio Testi* (Bing)

= Applicazioni degli LLM nella Vita Quotidiana

== Chatbot e Assistenza Virtuale
- *Chatbot* 🤖: software che simula conversazioni umane
  - Esempi: *ChatGPT*, *Gemini*, *Claude*
  - Capacità di adattarsi a diversi contesti e domande -- Via *Prompt*
#components.side-by-side(columns: 4)[
  #align(center)[
    #image("figures/gpt.png", width: 60%)
  ]
][
  #align(center)[
    #image("figures/gemini.png", width: 60%)
  ]
][
  #align(center)[
    #image("figures/claude.png", width: 60%)
  ]
][
  #align(center)[
    #image("figures/deepseek.png", width: 60%)
  ]
]
== Chatbot -- Operazioni di Base
- Question Answering 🤔: Rispondere a domande
  - *Esempio* 🤔: "Qual è la capitale dell'Italia?"
- Summarization 📝: Riassumere testi
  - *Esempio* 📝: "Riassumi l'articolo sul cambiamento climatico."
- Translation 🌍: Tradurre testi
  - *Esempio* 🌍: "Traduci questa frase in francese."
- NB!! Attenzione alle allucinazioni

== Chatbot -- Allucinazioni
- *Allucinazioni* 🤯: generazione di testo non coerente o fuorviante
- Questi modelli sono soggetti a *bias* e *errori* 🚨
  - Provano a dare una risposta plausibile anche se non conoscono la risposta
#image("figures/pay-attention.png")

== Chatbot -- L'importanza del Prompt 
- _Prompt_ 🚀: la *frase* o *domanda* iniziale che l'utente scrive al chatbot.
#pause
- Un *buon prompt* è essenziale per ottenere risposte *accurate* e *utili*.
#pause
- Serve per *guidare* il chatbot verso la risposta desiderata 🤝
  - *Personal trainer* 🏋️: "Sei un PT e mi devi aiutare a creare una scheda di allenamento personalizzata."
  - *Medico* 🩺: "Sei un medico e mi devi aiutare a supportare la gestione della mia dieta."
  - *Chef* 🍳: "Sei uno chef e mi devi aiutare a creare un menù gustoso e bilanciato."
  - *Avvocato* ⚖️: "Sei un avvocato e mi devi aiutare a redigere un contratto di consulenza."

== Chatbot: Consulenza Legale e Normativa
- *Idea*: fornire le _normative_ e i _termini di legge_ necessari per la redazione di un contratto
#align(center)[
  #image("figures/regolamentazione.png", width: 40%)
]
== Chatbot: Chef Virtuale
- *Idea*: dare _ricette_ e _consigli_ per cucinare _piatti gustosi_ e _salutari_
#align(center)[
  #image("figures/chef.png", width: 40%)
]

== Chatbot: Supporto Allo Studio
- *Idea:* dare un _problema di matematica_ e _risolverlo_ in modo collaborativo
#align(center)[
  #image("figures/teaching.png", width: 40%)
]

== Chatbot: Sviluppo Software -- Copilot
- *Idea*: implementare un sistema di *autocompletamento* in tempo reale mentre si scrive _codice_
  - Fornire _snippet_ e _suggerimenti_ contestuali
  - Ridurre errori di _sintassi_ e velocizzare lo sviluppo
#align(center)[
  #image("figures/code-generation.png", width: 60%)
]


== Supporto alla Scrittura e Content Creation -- Grammarly e MaxAI
- *Idea*: AI in supporto alle attività di *scrittura* ✍️ e *creazione di contenuti*
- *Cosa?*
  - _Generare bozze_ a partire da un’idea 🤖
  - _Correggere_ errori grammaticali e stilistici 📝
  - _Cambiare tono_ (formale, amichevole, persuasivo) 🎨
  - _Suggerire parole_, frasi e sinonimi 🤔
  - _Individuare_ punti chiave e creare *riassunti rapidi* ⚡
  - _Fornire spunti_ su stili narrativi diversi 📚


== Strumenti di Apprendimento Assistito -- NotebookLM
#align(center)[
  #image("figures/notebookLM.png", width: 100%)
]

== Human Augmentation per Accessibilità
- Gli LLM possono essere utilizzati anche per *potenziare* le capacità umane
  - Ciechi: *riconoscere* immagini, *leggere* testi e *rispondere* a domande tramite assistenti vocali e visori specializzati
  - Muti: *generare* testi, *tradurli* in parlato e *interagire* con gli altri in tempo reale
  - Disabilità motorie: *digitazione predittiva*, *comandi vocali* e *navigazione* semplificata


#focus-slide("Grazie per l'attenzione!")
