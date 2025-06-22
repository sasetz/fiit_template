#import "@preview/fiit-thesis:0.1.0": *

#show: fiit-thesis.with(
  title: "Moja záverečná práca",
  thesis: "bp2",
  author: "Jožko Mrkvička",
  supervisor: "prof. Jožko Mrkvička",
  abstract: (
    sk: lorem(150),
    en: lorem(150),
  ), // abstract
  id: "FIIT-12345-123456",
  lang: "en", // this controls how the layout is presented, be careful!
  acknowledgment: [I would like to thank my supervisor for all the help and
  guidance I have received. I would also like to thank my friends and family
  for supporting during this work.]
)

= Introduction

#lorem(150)

= Analysis

#lorem(250)

#figure(
  caption: [FIIT logo in SVG file format for reference.],
  pad(2em,
    image("logo_fiit.svg", width: 50%)
  )
) <fiit-logo>

#lorem(150)

= Implementation

#lorem(250)

#figure(
  caption: [This is an example of a code listing in your thesis.],
  [```c
int main()
{
    printf("Hello World!\n");
    return 0;
}
  ```]
) <c-example>

== Citation example

This is an example of how to reference a paper in your thesis @riscv.

#lorem(150)

#figure(
  caption: [This is an example of a table that you can create using Typst.],
  table(
    columns: 2,
    table.header([*Left column*], [*Right column*]),
    [Some label], [Some data],
    [Another label], [Another data]
  )
) <c-example>

#lorem(200)

== Another subject

#lorem(100)

// has the right format, goes before appendices
#bibliography("citations.bib")
#pagebreak(weak: true)

// resume.typ
#set heading(numbering: none)
#pagebreak()
= Resumé <resume>
// resume.typ

#lorem(250)

// appendix.typ
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
// appendix.typ

= Source code
#lorem(150)

= Plan of work <plan-of-work>

#pagebreak()

