
# FIIT Thesis Template with Typst

---

Status: in development ⚙️

This is a Typst template for writing a thesis at the Faculty of Informatics and
Information Technologies (FIIT) in Slovak Technical University in Bratislava
(STU). The template was crafted using the for the
[official requirements and conditions, as of May 2025](https://www.fiit.stuba.sk/studium/bakalarsky-projekt/bp.html?page_id=1862)
provided by the faculty, with [this LaTeX template] being the basis for how the
document looks.

The template is available in these languages: **Slovak**, **English**

# Usage

---

You can use [Typst's online editor](https://typst.app/) to edit and display
your thesis. [Sign up](https://typst.app/signup), sign in and click "Start from
template". Search for "fiit-thesis" and start writing!

## Building your thesis locally

0. [Install Typst](https://github.com/typst/typst?tab=readme-ov-file#installation).
If you're on Linux, it should be pretty easy.

0. Next, initialize the template using:

```bash
typst init @preview/fiit-thesis
```

0. Start watching the changes of your thesis using:
```bash
typst watch main.typ --watch
```

0. Begin writing your thesis!

If you're new to Typst, we recommend to start reading the [Typst
tutorial](https://typst.app/docs/tutorial/).

Don't forget to intialize a Git repository and backup your work somewhere!

## Template arguments

The template supports general customization options. First, you should choose
the language that you are writing this paper in using `lang` argument.
Currently supported languages are listed at the top of this page. If you choose
an unsupported language, the template will generate a compile error.

Next, you should insert general info for your thesis: `name`, `author`, `id`,
`supervisor`. They are pretty straight-forward, so just write the correct data
into them. `id` is your thesis ID number from the informational system.

`thesis` selects the type of your work. The allowed values are: `bp1`, `bp2`,
`dp1`, `dp2`, `dp3`. These values control what text is displayed on the title
and cover pages.

`abstract` is a dictionary of the translated abstracts that you provide with
your work. The keys are the language identifiers, like the `lang` argument.
The values are the abstract text. `en` and `sk` keys are required for thesis
to compile. The template shows an example of how the dictionaries are created
in Typst.

`acknowledgment` sets the acknowledgment text. You can write anything you want
here.

## Appendices

To style the appendices correctly, a few lines of code need to be right before
the first appendix. Unfortunately, we couldn't find a way to include them like
a function or something similar, so you should just leave those lines be. If
you're writing your thesis in Slovak or some other language, translate the word
"Appendix" in the snippet to your language of choice. If you erase them by
mistake, you can find them in `appendix.typ` file in this repository. You can
also use `#include("appendix.typ")` to include this file into your thesis.

When referencing an appendix, use this snippet to change the wording of the
reference from "Section" to "Appendix" or "Príloha". The letter of the appendix
will be automatically inserted.

```typst
@appendix_code[Appendix]
```

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
`disable_placeholder` argument in the template function to `true`.

# Contributing

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

