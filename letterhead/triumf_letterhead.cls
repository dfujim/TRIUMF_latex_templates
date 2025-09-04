
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{triumf_letterhead}[Dec 14, 2023 Latex Class Emulating TRIUMF Letterhead]

\LoadClass[letterpaper]{article}
\RequirePackage{fontspec} 				% for loading fonts
\RequirePackage{url,parskip} 	    % other packages for formatting
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[margin=2.5cm, top=1cm, bottom=1.5cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage[unicode, colorlinks=true, allcolors=blue]{hyperref}

% set font style
\setmainfont{Helvetica Neue Light}
\newfontface\footerfont{HelveticaNeueHeavy}
\renewcommand{\footnotesize}{\fontsize{8pt}{0}\selectfont}
\renewcommand{\normalsize}{\fontsize{10.5pt}{0}\selectfont}

% Setup fancyhdr package
\fancyhf{}
\fancyhfoffset{0em}

% page formatting
\renewcommand{\headrulewidth}{0pt}  % Remove head rule
\pagestyle{fancy}
\textheight 9.6in

% define TRIUMF color
\definecolor{blue}{HTML}{33B8EF}

% Define author's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define author's information
% Usage: \address{<address>}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\extension}[1]{\def\@extension{#1}}

% define saluatation
\newcommand*{\salutation}[1]{\def\@salutation{#1}}

% Render header
\newcommand*{\makeheader}{

    % setup triumf logo
    \begin{minipage}{\linewidth}
      \hspace{-1.75cm}
      \includegraphics[keepaspectratio=true,height=0.9cm]{TRIUMF_Logo_Blue.pdf}
    \end{minipage}
    \bigskip
    \bigskip

    \color{black}
    \today \par
    \bigskip
    \@salutation\par
    \bigskip
}

% Render footer
\newcommand*{\makefooter}{
    \fancyfoot[L]{
      \footnotesize
      \footerfont
      \color{blue}
      \begin{tabular}{p{5cm}p{3cm}l}
        t  (604) 222.1047 ext.\@extension & www.triumf.ca & 4004 Westbrook Mall\\
        \@email & @TRIUMFLab & Vancouver BC V6T 2A3 Canada
      \end{tabular}
    }
    \fancyfoot[R]{
      \vspace{-2.5cm}
      \color{blue}
      \fontsize{16pt}{0}\selectfont
      \footerfont
      \rotatebox{90}{Discovery,}
      \rotatebox{90}{accelerated}
      \hspace{-1.75cm}
    }
}

% signature
\newcommand*{\makesignature}{
  \vspace{0.5cm}
  \raggedright
  Sincerely,\par
  \vspace{0.25cm}
  \@firstname~\@lastname
}

% Resume part title definition
\newcommand\sectionTitle[2]{\section{\texorpdfstring{\color{blue}#2\enspace \textsc{#1}}{#1}}}

% ---------------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

