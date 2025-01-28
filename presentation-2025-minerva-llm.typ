#import "@preview/touying:0.5.2": *
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
  - Corsi su Paradigmi di Sviluppo e la integrazione con l'AI
- Per contatti: gianluca.aguzzi\@unibo.it

== Outline
=== Temi che verranno trattati:
- Introduzione agli LLM: Cosa sono, come funzionano e perché sono rivoluzionari
- Applicazioni degli LLM nella Vita quotidiana


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

== Rete Neurale Artificiale
- *Rete Neurale* 🧠: modello computazionale ispirato al funzionamento del cervello umano
  - *Neuroni* 🧠: unità computazionale che riceve input e produce output
  - *Connessioni* 🧠: collegamenti tra neuroni che trasmettono segnali
  - *Strati* 🧠: insieme di neuroni collegati in modo sequenziale
- Questa struttura permette di *apprendere* da dati e *risolvere problemi* complessi
  - Comprendere immagini, audio e testo 📸🔊📝

== Come - Generazione del testo
#image("figures/1.png")

== Come - Generazione del testo
#image("figures/2.png")

== Come - Generazione del testo
#image("figures/3.png")

== Perché Apprendere il Linguaggio è importante?
- Il Linguaggio è uno dei mezzi per esprimere la nostra intelligenza 🗣️
  - *Comunicazione*, *apprendimento*, *ragionamento* 🤔
  - Misurare l'intelligenza attraverso il linguaggio #fa-arrow-right() _Test di Turing_ 🤖

- Se un AI può comprendere e generare linguaggio, può:
  - Interagire con gli umani in modo più naturale 👥
  - Apprendere da testi e conversazioni 📚
  - Risolvere problemi complessi 🧠

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
- Gli LLM ormai sono onnipresenti nella nostra vita quotidiana 📱 (pervasivi)
  - *Assistenti Virtuali* (Siri, Alexa, Google Assistant)
  - *Traduzione Automatica* (Google Translate)
  - *Ricerca e Filtraggio Testi* (Bing)

= Applicazioni degli LLM nella Vita Quotidiana

== Chatbot e Assistenza Virtuale

== Chatbot -- L'importanza del Prompt 
- _Prompt_ 🚀: la *frase* o *domanda* iniziale che lʼutente scrive al chatbot.
#pause
- Un *buon prompt* è essenziale per ottenere risposte *accurate* e *utili*.
#pause
- Serve per *guidare* il chatbot verso la risposta desiderata 🤝
  - Personal trainer 🏋️: "Sei un PT e mi devi aiutare a creare una scheda di allenamento personalizzata."
  - Medico 🩺: "Sei un medico e mi devi aiutare a supportare la gestione della mia dieta."
  - Chef 🍳: "Sei uno chef e mi devi aiutare a creare un menù gustoso e bilanciato."
  - Avvocato ⚖️: "Sei un avvocato e mi devi aiutare a redigere un contratto di consulenza."

== Chatbot: Supporto Legale
== Chatbot: Supporto Sanitario
== Chatbot: Personalizzazione del Tono
== Chatbot: Sviluppo Software
== Ricerca e Filtraggio Testi
== Supporto alla Scrittura e Content Creation
== Strumenti di Apprendimento Assistito
== Human Augmentation -- LLM Per il Supporto ai Ciechi
== Traduzione e Localizzazione

#focus-slide("Grazie per l'attenzione!")


Nella presentazione di Giovedì verranno presentati i Large Language Models, modelli di intelligenza artificiale che stanno rivoluzionando il modo in cui interagiamo con i computer. Verranno esplorate le loro applicazioni nella vita quotidiana, come chatbot, assistenti virtuali e strumenti di supporto alla scrittura e concetti fondanti di come questi modelli funzionano e come sono stati addestrati. 
. Un'occasione per capire come l'Intelligenza Artificiale sta cambiando il nostro modo di vivere e lavorare.