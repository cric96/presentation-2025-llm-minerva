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
  footer: self => self.info.institution,
  config-common(
    // handout: true,
    preamble: pdfpc-config, 
  ),
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Authors],
    date: datetime.today(),
    institution: [Institution],
    // logo: emoji.school,
  ),
)

#set text(font: "Fira Sans", weight: "light", size: 18pt)
#show math.equation: set text(font: "Fira Math")

#title-slide(
  title: "Small Langauge Model for Personalized Healthcare",
  subtitle: "",
  author: "Gianluca Aguzzi",
  date: datetime.today().display("[day] [month repr:long] [year]"),
  institution: "Università di Bologna"
)
/*
Presentation Flow 

LLM What and Main alternatives
 => Big and Closed, best performing
 => Small and Open, best for privacy, good compromise
LLM Why
 => Performance
 => Applied in healthcare

LLM How? 
  => First fast, self-supervised
  => Second phases, adaptability
    => in context learning (RAG, prompt eng, etc)
    => fine tuning
      => efficient
      => RL

Small LLM what
  => not a clear defintiion, as "for big data"
  what small is?
  => but they have some interesting application

Small LLM where
  Personalalized heatlcare:
    A,b,c

Use Case => Chatbot for hypertensive patients:
  Requirements: 
  Validation (two phase)
    => automatic
    => by physicians

  First test:
    => small LLM have similar performance w.r.t. big for simplier task with go

SLM in Common wears perspective:
- Combine my expertise

SLM: cooperative
=> SLM can be used collaborating with other SLM to reach a collective performamnce
e.g., physician during 
How?
  => coordination
  => communication
  => Orchestration

*/

= Introduction

== LLM -- what
- A *Language model* is a model which is able to generate text, given a prompt.

#align(
  center,
  block[
    #image("figures/llm-nutshell.png", width: 80%)
  ]
)

- Training #fa-arrow-right()  large corpora of text in a *self-supervised* way.
- Two main alternatives:
  - Large and Closed #fa-arrow-right() best performing, but privacy concerns (e.g., GPT-\*, Claude, Gemini, etc.),
  - Small and Open #fa-arrow-right() best for privacy, good compromise (e.g., LLaMa, Gemma, Phi, etc.)

== LLM -- Why
- *Performance*: LLMs are the state-of-the-art reaching (super-)human performance in many tasks.
- *Generalist*: LLMs can be adapted to many tasks, including educational, healthcare, etc.

#block[
    #image("figures/shift.png", width: 30%)
]

== LLM -- How
- A *generalist* (or _foundational_) *model* is trained first, then adapted to a specific task.

#align(
  center,
  block[
    #image("figures/shift.png", width: 50%)
  ]
)
- Adaptation can be done in two phases:
  - *In-context* learning #fa-arrow-right() RAG, Prompt Engineering, etc.
  - *Fine-tuning*  #fa-arrow-right() Parameter-efficient fine-tuning, RLHF, etc.

== Small LM -- what

- Small Language Models stand for models which are small *#fa-smile()*
  - It is not clear what "small" means, as it is relative to the task.
  - Mainly, with small means that they can be deployed on a single (machine/gpu).

- Several open source projects
  - *LLaMa* 3.2 (meta): 1 to 3 billion parameters, showing good performance on many tasks and they are compatible with smarhgpone
  - *Gemma* 2 (google): 2 to 9 billion parameters
  - *Phi* (meta): 1 to 3 billion parameters

== Small LM -- Why 
- *Privacy*: Smaller models can be fully trained on sensitive data *in-house*, protecting _confidentiality_.
- *Efficiency*: Reduced _compute_ and _memory requirements_ lower costs and _energy_ usage.
- *Real-time*: _Faster_ inference speeds enable on-device, _immediate_ predictions and responses.

#fa-arrow-right() Kind of a _manifesto_ for *Edge AI*

#align(
  center,
  block[
    #image("figures/llama3.2b.png", width: 40%)
  ]
)