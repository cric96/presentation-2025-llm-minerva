#import "@preview/polylux:0.3.1": *
#import "@preview/fontawesome:0.1.0": *

#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: [SLM in Healthcare, Gianluca Aguzzi],
)

#set text(font: "Inter", weight: "light", size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 150)
#set par(justify: true)

#set raw(tab-size: 4)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 1em,
  radius: 0.7em,
  width: 100%,
)

#title-slide(
  title: "Small Langauge Model for Personalized Chatbot",
  subtitle: "",
  author: "Gianluca Aguzzi",
  date: datetime.today().display("[day] [month repr:long] [year]"),
)

#new-section-slide("Introduction")

#slide(title: "Large Language Model - What")[
  
]

#slide(title: "Large Language Model - Why")[
  
]

#slide(title: "Large Language Model - How")[
  
]

#slide(title: "Large Language Model - Healtcare")[
  
]

#new-section-slide("Towards SLM")

#slide(title: "Small Language Model - What")[
  
]

#slide(title: "Case Study: Chatbot for hypertensive patients")[
  
]

#new-section-slide("SLM - Common wears perspective")

#slide(title: "Message for common-wears project")[
  Message 
]

#slide[
  #bibliography("bibliography.bib")
]
