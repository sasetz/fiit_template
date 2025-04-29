#set page(numbering: appendix-numbering)
#set heading(numbering: "A.1")
#show heading.where(level: 1) : it => {
  set text(1.6em)
  set par(first-line-indent: 0em)
  pagebreak()
  counter(page).update(1)
  pagebreak(weak: true)
  block(height: 5em)
  // WARN: translate the word "Appendix" to your language
  [*Appendix #numbering("A", counter(heading).get().at(0))*]
  v(.5em)
  it.body
  v(1.8em)
}
#counter(heading).update(0)
#counter(page).update(1)
