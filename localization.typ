#let literals = (
  en: (
    university: "Slovak Technical University in Bratislava",
    faculty: "Faculty of Informatics and Information Technologies",

    title-page: (
      fields: (
        program: "Programme",
        field: "Study field",
        department: "Department",
        supervisor: "Supervisor",
      ),
      values: (
        month: (
          may: "May",
        ),
        thesis: (
          bachelor: "Bachelor thesis",
          diploma: "Diploma thesis",
          bp1: "Interim report on BP1",
          dp1: "Interim report on DP1",
          dp2: "Interim report on DP2",
        ),
        program: (
          informatics: "Informatics",
        ),
        field: (
          informatics: "Informatics",
        ),
        department: (
          upai: "070200 Institute of Computer Engineering and Applied Informatics",
          iise: "070400 Institute of Informatics, Information Systems and Software Engineering",
        ),
      ),
    ),

    annotation: (
      title: "Annotation",
      author: "Author",
    ),

    contents: (
      title: "Contents",
    ),
  ),

  sk: (
    university: "Slovenská technická univerzita v Bratislave",
    faculty: "Fakulta informatiky a informačných technológií",

    title-page: (
      fields: (
        program: "Študijný program",
        field: "Študijný odbor",
        department: "Miesto vypracovania",
        supervisor: "Vedúci práce",
      ),
      values: (
        month: (
          may: "Máj",
        ),
        thesis: (
          bachelor: "Bakalárska práca",
          diploma: "Diplomová práca",
          bp1: "Priebežná správa o riešení BP1",
          dp1: "Priebežná správa o riešení DP1",
          dp2: "Priebežná správa o riešení DP2",
        ),
        program: (
          informatics: "Informatika",
        ),
        field:  (
          informatics: "Informatika",
        ),
        department: (
          upai: "070200 Ústav informatiky, informačných systémov a softvérového inžinierstva",
          iise: "070400 Ústav počítačového inžinierstva a aplikovanej informatiky",
        ),
      ),
    ),

    annotation: (
      title: "Anotácia",
      author: "Autor",
    ),

    contents: (
      title: "Obsah",
    ),
  ),
)

#let localization(lang: "sk") = {
  assert(lang == "en" or lang == "sk", message: "please select a valid language for localization to work")
  return literals.at(lang)
}
