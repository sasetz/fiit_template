#set page(numbering: appendix-numbering)
// WARN: translate the word "Appendix" to your language
#let appendix-supplement = "Appendix"
#set heading(numbering: "A.1", supplement: appendix-supplement)
#show heading.where(level: 1): it => {
  set text(1.6em)
  set par(first-line-indent: 0em)
  pagebreak()
  counter(page).update(1)
  pagebreak(weak: true)
  block(height: 5em)
  [*#appendix-supplement #numbering("A", counter(heading).get().at(0))*]
  v(.5em)
  it.body
  v(1.8em)
}
#counter(heading).update(0)
#counter(page).update(1)
