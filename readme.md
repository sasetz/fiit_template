
# FIIT Thesis Template with Typst

Status: in development ⚙️

---

This is a Typst template for writing a thesis at the Faculty of Informatics and
Information Technologies (FIIT) in Slovak Technical University in Bratislava
(STU). The template was crafted using the for the
[official requirements and conditions, as of May 2025](https://www.fiit.stuba.sk/studium/bakalarsky-projekt/bp.html?page_id=1862)
provided by the faculty, with [this LaTeX template] being the basis for how the
document looks.

The template is available in these languages: **Slovak** (sk), **English** (en)

# Usage

You can use [Typst's online editor](https://typst.app/) to edit and display
your thesis. [Sign up](https://typst.app/signup), sign in and click "Start from
template". Search for "fiit-thesis" and start writing!

## Building your thesis locally

1. [Install Typst](https://github.com/typst/typst?tab=readme-ov-file#installation).
If you're on Linux, it should be pretty easy.

2. Next, initialize the template using:

```bash
typst init @preview/fiit-thesis
```

3. Start watching the changes of your thesis using:
```bash
typst watch main.typ --watch
```

4. Begin writing your thesis!

If you're new to Typst, we recommend to start reading the [Typst
tutorial](https://typst.app/docs/tutorial/).

Don't forget to intialize a Git repository and backup your work somewhere!

## Cheatsheet

| Option | Type | Example/Default | Description | Possible values |
| ------------- | -------------- | -------------- | -------------- | -------------- |
| title | `str` | "Moja záverečná práca" | thesis title | |
| thesis | enum (`str`) | "bp2" | type of your thesis | "bp1", "bp2", "dp1", "dp2", "dp3" |
| author | `str` | "Jožko Mrkvička" | your name | |
| supervisor | `str` or `array` of `str` | "prof. Jozef Mrkva, PhD." | your supervisor | `str` if you have one supervisor, `array` if many |
| abstract | `dict` | `( sk: lorem(150), en: lorem(150) )` | abstract in two languages | keys are the language, with `str` as values |
| id | `str` | "FIIT-12345-123456" | id from AIS | |
| lang | `str` | "en" | language of your thesis | "sk", "en" |
| acknowledgment | `str` | "Omitted" | thanks at the start of the thesis | |
| tables-outline | `bool` | `false` | enable tables outline | |
| figures-outline | `bool` | `false` | enable figures outline | |
| abbreviations-outline | `array` | `( ("SSL", "Secure socket layer"), ... )` | list of abbreviations, if you need one | |
| disable-placeholder | `bool` | `false` | disable the assignment placeholder warning page | |
| disable-cover | `bool` | `false` | disable cover page (the first one) | |
| regular-pages | `bool` | `false` | enable estimate for how many regular pages your thesis has | |
| bibliography-style | `str` | "iso-690-numeric" | leave as default, other values are wrong | see [docs](https://typst.app/docs/reference/model/bibliography/#parameters-style) |

## Template

The template supports general customization options. First, you should choose
the language that you are writing this paper in using `lang` argument.
Currently supported languages are listed at the top of this page. If you choose
an unsupported language, the template will generate a compile error.

Next, you should insert general info for your thesis: `title`, `author`, `id`,
`supervisor`. They are pretty straight-forward, so just write the correct data
into them. `id` is your thesis ID number from the informational system.
`supervisor` supports two options: either one supervisor's name as a string,
or an array of pairs, where each pair contains position of the supervisor and
their name. With the second option, you can add multiple supervisors, but
please make sure that you write the positions in the language of the rest of
the thesis.

`thesis` selects the type of your work. The allowed values are: `bp1`, `bp2`,
`dp1`, `dp2`, `dp3`. These values control what text is displayed on the title
and cover pages. Sometimes, you might get an error while upgrading your thesis
to the final stage. Pay attention to those errors, as they tell you how exactly
your work should be structured.

`abstract` is a dictionary of the translated abstracts that you provide with
your work. The keys are the language identifiers, like the `lang` argument.
The values are the abstract text. `en` and `sk` keys are required for thesis
to compile. The template shows an example of how the dictionaries are created
in Typst.

`acknowledgment` sets the acknowledgment text. You can write anything you want
here.

`regular-pages` is a boolean that allows you to estimate the length of your
thesis in "regular" pages. It disables most of the formatting, completely
erases headers, title/abstract pages and figures. It wouldn't be a perfect page
count, since it leaves the paragraphs and linebreaks, but it's still pretty
accurate if you just want to quickly get the idea of how much text you really
have.

`table-outline` is a boolean, set it to true to enable list of tables.

`figures-outline` enables list of figures (pictures).

`abbreviations-outline` is an array of pairs, where each pair contains an
abbreviation and its explanation. If you leave this argument as default or
explicitly empty, the list of abbreviations will not show.

`disable-cover` lets you disable the first (cover) page of the thesis. That's
it.

## Appendices

To style the appendices correctly, a few lines of code need to be right before
the first appendix. Unfortunately, we couldn't find a way to include them like
a function or something similar, so you should just leave those lines be. If
you're writing your thesis in Slovak or some other language, translate the word
"Appendix" in the snippet to your language of choice. If you erase them by
mistake, you can find them in `appendix.typ` file in this repository.

To reference the appendix, just use regular Typst referencing. The word
"Appendix" will be inserted automatically.

## Resumé

The resumé chapter is a chapter that is needed only when you write your thesis
in a language other from Slovak. Right before it starts, you should disable
header numbering, as the resumé is not required to be a chapter in the
document. Here's how to do that:

```typst
#set heading(numbering: none) // disable chapter numbering for the resumé
```

## How to hand in the thesis?

To hand in the thesis, it needs to be separated into two parts, and your thesis
assignment needs to be inserted into the final PDF.

### How to separate the thesis?

The file needs to be separated into the main part, and the appendices part.
You can use external tools for that. One tool that works is `pdfarrange` (GUI).
CLI tools such as `pdftk` could also do the job.

### How to insert the thesis assignment?

Unfortunately, Typst cannot insert PDFs into the document. You should use other
tools to do that, like the ones mentioned earlier.

You may have noticed that the document produces a red striped page with a
warning in it. This page is supposed to be replaced with the thesis assignment,
leave it on until you are going to do that. To disable it, set the
`disable-placeholder` argument in the template function to `true`.

# Developing

To develop the template, you should install [Task](https://taskfile.dev/). Here
are the tasks that you can run:

- `template`: compile the template example
- `watch`: watch the template example
- `thumbnail`: compile the template thumbnail
- `install-local`: install the package into @local namespace
- `uninstall-local`: uninstall the package from @local namespace
- `install-preview`: install the package into @preview namespace
- `uninstall-preview`: uninstall the package from @preview namespace

If you want to help out, take a look at the TODOs that are littered throughout
the code. If you found a bug or something we could improve upon, feel free to
open an issue on GitHub.

# Contact

If you have any questions, feel free to contact me: [Sasetz](https://github.com/sasetz/)

