\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{memo_template}[2026/07/28 Memo-style document class]

% Class to implement basic TCM template
% use macros to set the header fields
% Memo Number   \memonum
% Subject       \title
% To            \memoto
% CC            \memocc
% From          \author
% Supercedes    \memosup
% The headder is implemented as a tabularx table.
% Use \newline, not \\, to force a new line.
% Might wish to do so when listing multiple authors
%
% fancyhdr is used to put the logo in the upper right, other
% header/footer fields are available to the user.

\newcommand{\@memoptptsize}{11pt}
\DeclareOption{10pt}{\def\@memoptptsize{10pt}}
\DeclareOption{11pt}{\def\@memoptptsize{11pt}}
\DeclareOption{12pt}{\def\@memoptptsize{12pt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{11pt}
\ProcessOptions\relax

\PassOptionsToClass{\@memoptptsize,oneside}{article}
\LoadClass{article}

\RequirePackage[letterpaper,margin=1in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{blindtext}
\RequirePackage{unicode-math}
\RequirePackage{fontspec}
\RequirePackage{makecell}
\RequirePackage{parskip}
\RequirePackage{tabularx}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5\baselineskip}

\setmainfont{NotoSerif}[
  Path = ../fonts/,
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic,
]
\setsansfont{Arial}[
  RegularFont    = Arial,
  BoldFont       = Arial Bold,
  ItalicFont     = Arial Italic,
  BoldItalicFont = Arial Bold Italic
]
\setmathfont{NotoSansMath-Regular}[
  Path = ../fonts/,
  Extension = .ttf
]
\setmonofont{Consolas}

\renewcommand{\familydefault}{\sfdefault}

\setlength{\headheight}{30pt}

\newcommand{\memologo}{../logos/logo1.pdf}
\newcommand{\setlogo}[1]{\renewcommand{\memologo}{#1}}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\raisebox{-0.5\height}{\includegraphics[height=1.0cm]{\memologo}}}
\fancyfoot[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}

\newcommand{\@memonum}{}
\newcommand{\@memoto}{}
\newcommand{\@memocc}{}
\newcommand{\@memosup}{}

\newcommand{\memonum}[1]{\gdef\@memonum{#1}}
\newcommand{\memoto}[1]{\gdef\@memoto{#1}}
\newcommand{\memocc}[1]{\gdef\@memocc{#1}}
\newcommand{\memosup}[1]{\gdef\@memosup{#1}}

\newcolumntype{L}{>{\raggedright\arraybackslash}X}

\renewcommand{\maketitle}{
  \begin{centering}
    {\Large\bfseries Technical Coordination Memorandum\par}
    \bigskip
  \end{centering}
  \begin{flushleft}
    {
      \renewcommand{\arraystretch}{1.2}
      \begin{tabularx}{\linewidth}{@{}l L}
        \textbf{\MakeUppercase{TCM Number:}} & \@memonum \\
        \textbf{\MakeUppercase{Subject:}}    & \@title \\
        \textbf{\MakeUppercase{To:}}         & \@memoto \\
        \textbf{{\MakeUppercase{cc:}}}       & \@memocc \\
        \textbf{\MakeUppercase{From:}}       & \@author \\
        \textbf{\MakeUppercase{Date:}}       & \@date \\
        \textbf{\MakeUppercase{Supercedes:}} & \@memosup \\
      \end{tabularx}
    }
  \end{flushleft}
  \noindent\rule{\textwidth}{1pt}\hfill
  \thispagestyle{fancy}
}

\AtBeginDocument{\thispagestyle{fancy}}

\endinput
