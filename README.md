# LaTeX UCT Report

LaTeX template useful for UCT reports (lab reports or BSc final year project 
reports) and formal Masters or Doctoral dissertations.

**Disclaimer note:** these resources are based around what has been used in 
the Department of Electrical Engineering at UCT; different departments or 
research units may have their own approaches and expectations of what is 
required and how to prepare technical documents of this nature.  You are thus 
advised to ensure your work is aligned to what is needed for your context.
We are providing this resources as use-at-own-risk contributions (see license 
details link below).

## Dependencies

This template compiles using pdfLaTeX.  For the `make figures` target to also 
work, InkScape has to be installed and available on the system path.

The Makefile works in Windows, but it assumes that you're running it from 
within a bash-like terminal.  The easiest way to do this is to use
[Git Bash](https://git-scm.com).  You will also need to install
[GNU Make](https://www.gnu.org/software/make/), which comes standard with 
[TDM-GCC](https://jmeubank.github.io/tdm-gcc/).

## Repository Structure

The [`Bibliography`](Bibliography), [`Figures`](Figures) and 
[`Template`](Template) folders contain shared resources that both report types 
make use of.  The two report types are situated in the [`Article`](Article) 
and [`Report`](Report) folders.  The [`Output`](Output) folder contains the
output generated with all possible option flags.

## Usage Instructions

There are two intended use cases:

1. Include the repository as a Git submodule and `\input` the contents of the 
   `Template` folder directly.  In this case, copy the `Report` or `Article`, 
   as well as the `Figures` and `Bibliography` folders, to an appropriate 
   place in the parent repository, correct the paths of the `\input` commands 
   and you're all set.
1. Fork the repository and edit the examples directly.

In both cases it is relatively easy to keep both sides up to date.

### Configuring the Flags

The output style is controlled by means of flags defined in the
`Template/Flags.tex` file of each report type.  Set the flags as appropriate.

### Building the Output

- To build the report, run `make`.
- To convert only the figures, run `make figures`.  This is useful if you're 
  using some other build chain or IDE, such as [TeXstudio](https://www.texstudio.org/)
- To clean up all build products, run `make clean`.

### Building All Options

There is a special make target `all_options`, which generates output for all 8 
combinations of the option flags for both Article and Report types.  The 
resulting PDFs are saved in the [`Output`](Output) folder.

## Figures Preview Feature

It is sometimes handy to have a quick reference to all your figures, and where 
to find them.  The `FiguresPreview` folder is meant for this purpose.  To 
update, browse to that folder and run `make` within a bash-style console.

## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

