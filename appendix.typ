#set page(numbering: appendix-numbering)
#set heading(numbering: "A.1")
#show heading.where(level: 1) : it => {
  set text(1.6em)
  set par(first-line-indent: 0em)
  pagebreak()
  block(height: 5em)
  [*Dodatok #numbering("A", counter(heading).get().at(0))*]
  v(.5em)
  it.body
  v(1.8em)
  counter(page).update(1)
}
#counter(heading).update(0)
#counter(page).update(1)
