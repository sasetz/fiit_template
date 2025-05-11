#import "pages.typ": *
#import "localization.typ": localization

#let fiit-thesis(
  // theme of your thesis
  title: "Záverečná práca",
  // type of the thesis: "bp1", "bp2", "dp1", "dp2", "dp3"
  thesis: "bp2",
  // a dictionary of type: <language_code>: <abstract>. "sk" value is always required
  abstract: (
    sk: lorem(150),
    en: lorem(150),
  ), // abstract
  // your full name
  author: "Jožko Mrkvička",
  // ID that you copied from AIS
  id: "FIIT-12345-123456",
  // full name of your thesis supervisor
  supervisor: "prof. Jožko Mrkvička",
  // supported values: "en", "sk"
  lang: "en",
  // set to "true" to remove the assignment text placeholder
  disable_placeholder: false,
  // set to "true" to disable the first (cover) sheet
  disable_cover: false,
  body,
) = {
  // TODO: add an option to add extra supervisors
  // TODO: add an option to mimic the AIS cover and title pages

  let locale = localization(lang: lang)
  let slovak = localization(lang: "sk")

  // Set the document's basic properties.
  set document(author: author, title: title)
  set text(font: "New Computer Modern", lang: lang)
  show math.equation: set text(weight: 400)
  set heading(numbering: "1.1")
  show heading: it => {
    v(1em)
    it
    v(0.75em)
  }
  show heading.where(level: 1) : it => {
    set text(1.6em)
    set par(first-line-indent: 0em)
    pagebreak()

    if it.numbering != none {
      block(height: 5em)
      [#locale.chapter.title #counter(heading).get().at(0)]
      v(.5em)
    }
    it.body
    v(1.8em)
  }
  set bibliography(style: "iso-690-numeric")

  // asserts
  assert(abstract.keys().contains("sk") and abstract.keys().contains("en"),
    message: "Please provide an abstract in both Slovak and English language")
  assert(locale.title-page.values.thesis.keys().contains(thesis),
    message: "The thesis type you provided is not supported. Please contact the authors or choose one of the supported types")

  let fields = locale.title-page.fields
  let values = locale.title-page.values

  // FIXME: the cover sheet needs to be in English as well

  // cover sheet
  if not disable_cover {
    title-page(
      id: id,
      author: author,
      title: title,
      type: values.thesis.at(thesis),
      header: [
        #locale.university \
        #locale.faculty
      ],
      footer: (
        (left: fields.supervisor, right: supervisor),
      ),
      date: [#values.month.may #datetime.today().display("[year]")]
    )
  }
  // title page
  title-page(
    id: id,
    author: author,
    title: title,
    type: values.thesis.at(thesis),
    header: [
      #locale.university \
      #locale.faculty
    ],
    footer: (
      (left: fields.program, right: values.program.informatics),
      (left: fields.field, right: values.field.informatics),
      (left: fields.department, right: values.department.upai),
      (left: fields.supervisor, right: supervisor),
    ),
    date: [#values.month.may #datetime.today().display("[year]")]
  )

  pagebreak() // intentional empty page

  if not disable_placeholder {
    page(
      fill: tiling(size: (40pt, 40pt))[
        #place(line(start: (0%, 0%), end: (100%, 100%), stroke: 2pt + red))
      ]
    )[
      #set text(3em)
      #set par(justify: true)
      Use other tools to insert your generated assignment text instead of
      this page.

      This page can be turned off using the `disable_placeholder` argument.
    ]
  }
  pagebreak()
  pagebreak() // intentional empty page

  // cestne vyhlasenie
  // TODO: maybe (MAYBE) consider making the full name appear in the middle
  // below the line
  v(1fr)
  text(1.1em)[
    Čestne vyhlasujem, že som túto prácu vypracoval(a) samostatne, na základe
    konzultácií a s použitím uvedenej literatúry.
    #v(1.5em)
    // TODO: replace this with an appropriate Slovak date replace this with an appropriate Slovak date
    #datetime.today().display("V Bratislave, [day].[month].[year]")
    #h(1fr)
    \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.
    #linebreak()
    #h(1fr)
    #author
  ]
  pagebreak()
  pagebreak() // intentional empty page

  // even if the language is Slovak, the university requires students to provide
  // both versions of the abstract
  abstract-page(
    title: slovak.annotation.title,
    university: slovak.university,
    faculty: slovak.faculty,
    program: (left: slovak.title-page.fields.program, right: slovak.title-page.values.program.informatics),
    author: (left: slovak.annotation.author, right: author),
    thesis: (left: slovak.title-page.values.thesis.at(thesis), right: title),
    supervisor: (left: slovak.title-page.fields.supervisor, right: supervisor),
    date: [#slovak.title-page.values.month.may #datetime.today().display("[year]")],
    abstract.sk
  )
  pagebreak() // intentional empty page

  // locale abstract
  abstract-page(
    title: locale.annotation.title,
    university: locale.university,
    faculty: locale.faculty,
    program: (left: locale.title-page.fields.program, right: locale.title-page.values.program.informatics),
    author: (left: locale.annotation.author, right: author),
    thesis: (left: locale.title-page.values.thesis.at(thesis), right: title),
    supervisor: (left: locale.title-page.fields.supervisor, right: supervisor),
    date: [#locale.title-page.values.month.may #datetime.today().display("[year]")],
    abstract.at(lang)
  )

  pagebreak() // intentional empty page

  // table of contents
  // TODO: make an option to add table of contents for images, tables,
  // abbreviations and definitions
  set page(numbering: "i") // Roman numbering until the end of the contents
  show outline.entry.where(
    level: 1
  ): it => {
    set block(above: 1.8em)
    show text: it => strong(it)
    link(
      it.element.location(),
      it.indented(it.prefix(), [#it.body()#h(1fr)#it.page()]),
    )
  }
  show outline.entry: set block(above: 1.2em)
  outline(depth: 3, indent: auto)
  set page(numbering: none)
  v(1fr) // if the page is full, this will be a pagebreak
  pagebreak(weak: true) // if the page is not full, this will be a pagebreak
  counter(page).update(1) // start of the main section


  // main body
  set par(
    first-line-indent: 1em,
    justify: true,
    leading: 1.3em,
    spacing: 1.5em,
  )
  set page(
    numbering: "1",
    number-align: center,
    margin: 3cm,
    header: [
      #context{
        emph(hydra(1))
        v(-1em)
        line(length: 100%)
      }
    ]
  )

  // TODO: add Slovak resumé for non-Slovak theses
  // TODO: add the plan of work as a required appendix
  body
}

#let appendix-numbering(first, ..) = [
  #if counter(heading).get().at(0) != 0 [
    #numbering("A.1", counter(heading).get().at(0))-#first
  ]
]

