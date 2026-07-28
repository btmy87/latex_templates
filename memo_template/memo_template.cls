\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{memo_template}[2026/07/28 Memo-style document class]

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

\setmainfont{NotoSerif}[
  Path = ../fonts/,
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic,
]
\setsansfont{Arial}

\setmathfont{NotoSansMath-Regular}[
  Path = ../fonts/,
  Extension = .ttf
]

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

\renewcommand{\maketitle}{
  \begin{centering}
    {\Large\bfseries Technical Coordination Memorandum\par}
    \bigskip
  \end{centering}
  \begin{flushleft}
    \begin{tabular}{l l}
      \textbf{\MakeUppercase{TCM Number:}} & \@memonum \\
      \textbf{\MakeUppercase{To:}}         & \@memoto \\
      \textbf{\MakeUppercase{cc:}}         & \@memocc \\
      \textbf{\MakeUppercase{From:}}       & \@author \\
      \textbf{\MakeUppercase{Subject:}}    & \@title \\
      \textbf{\MakeUppercase{Date:}}       & \@date \\
      \textbf{\MakeUppercase{Supercedes:}} & \@memosup \\
    \end{tabular}
  \end{flushleft}
  \noindent\rule{\textwidth}{1pt}\hfill
  \thispagestyle{fancy}
}

\AtBeginDocument{\thispagestyle{fancy}}

\endinput
