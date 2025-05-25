#import "pages.typ": *
#import "localization.typ": localization
// TODO: GLOBAL: consider breaking down the function into smaller pages to help
// improve the customizability of the template

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
  // acknowledgment text
  acknowledgment: "Acknowledgment goes here",
  // set to "true" to remove the assignment text placeholder
  disable_placeholder: false,
  // set to "true" to disable the first (cover) sheet
  disable_cover: false,
  // remove everything except the text to count how many regular pages of text
  // you have
  regular_pages: false,
  body,
) = {
  // TODO: add an option to add extra supervisors

  let locale = localization(lang: lang)
  let slovak = localization(lang: "sk")

  show pagebreak: it => if regular_pages {none} else {it}
  show bibliography: it => if regular_pages {none} else {it}
  show outline: it => if regular_pages {none} else {it}
  show figure: it => if regular_pages {none} else {it}
  show colbreak: it => if regular_pages {none} else {it}

  show list.item: it => if regular_pages {it.body} else {it}
  show list: it => if regular_pages {it.body} else {it}
  show columns: it => if regular_pages {it.body} else {it}
  show align: it => if regular_pages {it.body} else {it}

  // Set the document's basic properties.
  set document(author: author, title: title)
  set text(font: "New Computer Modern", lang: lang)
  show math.equation: set text(weight: 400)
  set heading(numbering: "1.1")
  show heading: it => {
    if not regular_pages {
      v(1em)
      it
      v(0.75em)
    }
  }
  show heading.where(level: 1) : it => {
    if not regular_pages {
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
  }
  set bibliography(style: "iso-690-numeric")

  // asserts
  assert(abstract.keys().contains("sk") and abstract.keys().contains("en"),
    message: "Please provide an abstract in both Slovak and English language")
  assert(locale.title-page.values.thesis.keys().contains(thesis),
    message: "The thesis type you provided is not supported. Please contact the authors or choose one of the supported types")

  let fields = locale.title-page.fields
  let values = locale.title-page.values

  // cover sheet
  if not disable_cover and not regular_pages {
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
  if not regular_pages {
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
  }

  pagebreak() // intentional empty page

  if not disable_placeholder and not regular_pages {
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

  // acknowledgment
  if not regular_pages {
    v(1fr)
    par(
      text(1.5em)[
        *#locale.acknowledgment*
      ]
    )

    text(1.1em)[
      #acknowledgment
      #v(1.5em)
    ]
  }
  pagebreak()
  pagebreak() // intentional empty page
  // cestne vyhlasenie
  if not regular_pages {
    v(1fr)
    text(1.1em)[
      Čestne vyhlasujem, že som túto prácu vypracoval(a) samostatne, na základe
      konzultácií a s použitím uvedenej literatúry.
      #v(1.5em)
      // TODO: replace this with an appropriate Slovak date
      #grid(
        columns: (4fr, 3fr),
        rows: 2,
        gutter: 3pt,
        align: (left, center),
        row-gutter: .8em,
        grid.cell(
          rowspan: 2,
          align: start,
          datetime.today().display("V Bratislave, [day].[month].[year]")
        ),
        repeat("."),
        author
      )
    ]
  }
  pagebreak()
  pagebreak() // intentional empty page

  // even if the language is Slovak, the university requires students to provide
  // both versions of the abstract
  if not regular_pages {
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
  }
  pagebreak() // intentional empty page

  // locale abstract
  if not regular_pages {
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
  }

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
  outline(title: locale.contents.title, depth: 3, indent: auto)
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
        let hdr = hydra(1)
        if hdr != none {
          emph(hdr)
          v(-1em)
          line(length: 100%)
        }
      }
    ]
  )

  context {
    let resume = query(
      heading.where(level: 1).and(<resume>)
    )
    let plan-of-work = query(
      heading.where(level: 1).and(<plan-of-work>)
    )
    assert(resume.len() == 1 and resume.at(0).numbering == none or lang == "sk",
      message: "Could not find <resume> label in your work. Please create a resume chapter in Slovak and mark it with the <resume> label.")
    assert(plan-of-work.len() == 1,
      message: "Could not find <plan-of-work> label in your work. Please create a plan of work appendix and mark it with the <plan-of-work> label.")
    assert(plan-of-work.at(0).numbering == "A.1",
      message: "The plan of work (<plan-of-work> label) should be an appendix. Check if its numbering is right, did you forget to insert the appendix.typ snippet?")
  }
  body
}

#let appendix-numbering(first, ..) = [
  #if counter(heading).get().at(0) != 0 [
    #numbering("A.1", counter(heading).get().at(0))-#first
  ]
]

