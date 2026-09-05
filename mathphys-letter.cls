%%
%% This is file `mathphys-letter.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% mathphys-letter.dtx  (with options: `class')
%%
%% Copyright (C) 2012–2016 by Moritz Brinkmann <mo@uni-hd.de>
%%
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%%
%%     http://www.latex-project.org/lppl.txt
%%
%% This work has the LPPL maintenance status `maintained'.
%% The Current Maintainer of this work is Moritz Brinkmann.
%%
%% Do not distribute a modified version of this file under the same name.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[2007/07/20]
\ProvidesClass{mathphys-letter}
      [2016/03/01 v1.3 customized letter class]
\LoadClass[
     fontsize=11pt,
     paper=a4,
     parskip=half,
     backaddress=plain,
     refline=nodate,
     numericaldate=true,
     firsthead=false,
]{scrlttr2}[2011/04/02]
\RequirePackage{
      graphicx,     % use graphic-files
      kvoptions,    % key=value-stuff
      lastpage,     % page n of m
      marvosym,     % for the little phone and fax symbols
      tikz,         % used for absolute placing of logo and stuff
      xcolor,       % colored text
      ifthen,       % for if-then-ele-stuff
      hyperref,     % use cool pdf-features
}
\RequirePackage[mono=false]{libertine}    % use linux-libertine font family
\LoadLetterOption{DIN}
\LetterOptionNeedsPapersize{paper=a4}{a4}

\setlength{\textwidth}{115.5mm}
\setlength{\rightmargin}{62.86mm}
\setlength{\marginparwidth}{50.86mm}
\setlength{\marginparsep}{6mm}
\setlength\headsep{22mm}
\setlength{\marginparsep}{7.1mm}

\@setplength{lochpos}{14.3mm}
\@setplength{locvpos}{65mm}
\@setplength{locheight}{50mm}

\renewcommand{\raggedsignature}{\raggedright}

\hypersetup{
      pdfborder={0 0 0},
}
\SetupKeyvalOptions{
  family=MathPhys,
  prefix=MathPhys@
}
\DeclareStringOption[default]{fachschaft}
\DeclareBoolOption[true]{twoside}
\DeclareComplementaryOption{oneside}{twoside}
\ProcessKeyvalOptions*

\ifthenelse{\equal{\MathPhys@fachschaft}{mathe}\or\equal{\MathPhys@fachschaft}{mathematik}}{\def\MathPhysLogo{mathphys/MathPhysLogoMathe}}{
\ifthenelse{\equal{\MathPhys@fachschaft}{physik}}{\def\MathPhysLogo{mathphys/MathPhysLogoPhysik}}{
\ifthenelse{\equal{\MathPhys@fachschaft}{info}\or\equal{\MathPhys@fachschaft}{informatik}}{\def\MathPhysLogo{mathphys/MathPhysLogoInfo}}{
\ifthenelse{\equal{\MathPhys@fachschaft}{mathinf}}{\def\MathPhysLogo{mathphys/MathPhysLogoMathInf}}{

\typeout{using logo: default}\def\MathPhysLogo{mathphys/MathPhysLogo}}}}}
\setkomavar{backaddress}{Fachschaft MathPhysInfo\\INF 205\\Raum 01.301\\69120 Heidelberg}
\setkomavar{place}{Heidelberg}
\setkomavar{backaddressseparator}{ \textperiodcentered\ }
\AtBeginDocument{
\setkomavar{location}{%
\ifkomavarempty{fromname}{
\vspace*{11.11mm}
}{%
\textsf{\textbf{Ansprechpartner:}}\\
\usekomavar{fromname}\\
\ifkomavarempty{fromemail}{}{
\usekomavar{fromemail}
}
\vspace*{18.83mm}%18.83
}

\scriptsize \textsf\datename\\\normalsize\today
}
}
\newkomavar*[\null]{null}
\def\MathPhysReflineTrue{\setkomavar{null}{\null}}
\iftrue
\def\MathPhysSetLogo{
\tikz [remember picture,overlay]
\node [shift={(-46.15mm,-19.12mm)}]
      at (current page.north east)
         {\includegraphics%[width=92.29mm, height=38.24mm]
         {\MathPhysLogo.pdf}};
\tikz [remember picture,overlay]
    \node [shift={(-59.71mm,19.12mm)}]
     at (current page.south east)
     {\textcolor{unihd}{\rule{0.859mm}{26.241mm}}};
}
\def\MathPhysSetBars{
\tikz [remember picture,overlay]
    \node [shift={(-59.71mm,-19.12mm)}]
     at (current page.north east)
     {\textcolor{unihd}{\rule{0.859mm}{26.241mm}}};
\tikz [remember picture,overlay]
    \node [shift={(-59.71mm,19.12mm)}]
     at (current page.south east)
     {\textcolor{unihd}{\rule{0.859mm}{26.241mm}}};
}
\def\MathPhysSetFooter{
\tikz [remember picture,overlay]
\node [
shift={(-85.21mm,19.12mm)}
]
     at (current page.south east)
     {\parbox{4.4cm}{
     \color{gray}
     \sffamily
     \scriptsize
     \begin{flushright}
     \Telefon\quad 06221\,54-14\,999\\
     \FAX\quad 06221\,54-161\,14\,999\\
     \Letter\quad \href{mailto:mathphys@uni-hd.de}{mathphys@uni-hd.de}\\
     \href{http://mathphys.uni-hd.de}{http://mathphys.uni-hd.de}
     \end{flushright}
}};
\tikz [remember picture,overlay]
\node [
shift={(-34.01mm,19.12mm)}
]
     at (current page.south east)
     {\parbox{4.4cm}{
     \color{gray}
     \sffamily
     \scriptsize
     \begin{flushleft}
     Fachschaft MathPhysInfo\\
     Im Neuenheimer Feld 205\\
     Raum 01.301\\
69120 Heidelberg
     \end{flushleft}
}};
}
\def\MathPhysSetPageNumber{
\tikz [remember picture,overlay]
\node [shift={(-34.01mm,-47.15mm)}]
      at (current page.north east)
     {\parbox{4.4cm}{\textcolor{gray}{\normalfont \sffamily Seite \thepage\ von \pageref{LastPage}}}};
}
\setkomavar{firstfoot}{
\MathPhysSetLogo
\MathPhysSetFooter
}
\setkomavar{nexthead}{
\ifMathPhys@twoside
\ifthenelse{\isodd{\thepage}}{
\MathPhysSetLogo
}{
\MathPhysSetBars
}
\else
\MathPhysSetLogo
\fi
\MathPhysSetPageNumber
}
\setkomavar{nextfoot}{}
\pagestyle{myheadings}
\iftrue
\definecolor{unihd}{RGB}{153,0,0}
\else
\definecolor{unihd}{cmyk}{0,1,1,.4}
\fi
%%
%% This work consists of the files  mathphys-letter.dtx
%%                               a  README
%%               the derived files  mathphys-leter.cls
%%                                  mathphys-letter.pdf
%%                                  mathphys-example.tex
%%                      as well as  MathPhysLogo.pdf
%%                                  MathPhysLogoInfo.pdf
%%                                  MathPhysLogoMathe.pdf
%%                                  MathPhysLogoMathInf.pdf
%%                             and  MathPhysLogoPhysik.pdf
%%
%%
%% End of file `mathphys-letter.cls'.
