#set text(font: "Liberation Serif", size: 11pt)

#set page(
  paper: "a4", 
  margin: (x: 2cm, y: 2.5cm), 
  columns: 1,
  footer: [
    #set align(center)
    #context counter(page).display("1")
  ]
)
#set heading(numbering: "1.1 ")
// 1. 図全体の中央揃えを維持
#show figure: it => {
  set align(center)
  it
}

// 2. Typst標準の「Figure 1」などの自動付与を無効化する
#set figure(numbering: none, supplement: none)

// title, authors, affl.
#align(center)[
  #v(2em)
  #text(size: 18pt, weight: "bold")[$title$]
  #v(1.5em)
  
  #text(size: 12pt)[
    $for(authors)$
      $authors.name$#super[$authors.affiliation_index$]$sep$, 
    $endfor$
  ]
  #v(0.8em)
  
  #text(size: 10pt)[
    $for(affiliations/pairs)$
      #super[$it.key$] $it.value$ \
    $endfor$
  ]
]

#v(2.5em)

// abst.
$if(abstract)$
#grid(
  columns: (1fr, 85%, 1fr),
  [],
  [
    #set text(size: 10pt)
    #strong[Abstract:] #h(0.5em) $abstract$
  ],
  []
)
#v(2.5em)
$endif$

// main body
#set align(left)
$body$
