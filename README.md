# LaTeX UCT Report

LaTeX template useful for UCT reports and formal dissertations

## Dependencies

This template compiles using pdfLaTeX.  For the `make figures` target to also 
work, InkScape has to be installed and available on the system path.

The Makefile works in Windows, but it assumes that you're running it from 
within a bash-like terminal.  The easiest way to do this is to use
[Git Bash](https://git-scm.com).  You will also need to install
[GNU Make](https://www.gnu.org/software/make/), which comes standard with 
[TDM-GCC](https://jmeubank.github.io/tdm-gcc/).

## Usage Instructions

### Forking the Repository

The intended use is to fork the repository.  This way, any updates to this 
template repository can be merged into your repository, and vice versa.

### Configuring the Flags

The output style is controlled by means of flags defined in
[`Template/DefineFlags.tex`](Template/DefineFlags.tex).  Set the flags as
appropriate.

### Building the Output

- To build the report, run `make`.
- To convert only the figures, run `make figures`.  This is useful if you're 
  using some other build chain or IDE, such as
  [TeXstudio](https://www.texstudio.org/)
- To clean up all build products, run `make clean`.

### Building All Options

There is a special make target `all_options`, which generates output for all 8 
combinations of the option flags for the Article and Report types.

## License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

