#import "@preview/fiit-thesis:0.1.0": *

#show: fiit-thesis.with(
  title: "Záverečná práca",
  author: "Jožko Mrkvička",
  supervisor: "prof. Jožko Mrkvička",
  abstract: (
    sk: lorem(150),
    en: lorem(150),
  ), // abstract
  id: "FIIT-12345-123456",
  lang: "en", // this controls how the layout is presented, be careful!
)

= Introduction

#lorem(150)

= Analysis

#lorem(250)

= Implementation

#lorem(250)

== Citation example

This is an example of how to reference a paper in your thesis @riscv.

#pagebreak(weak: true)
= Appendix A: Source code

#lorem(150)

#pagebreak()

#pagebreak()

// has the right format
#bibliography("citations.bib")

