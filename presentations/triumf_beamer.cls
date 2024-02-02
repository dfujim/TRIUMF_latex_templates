% Unofficial TRIUMF presentation template
% Derek Fujimoto
% Dec 15, 2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{triumf_beamer}[Dec 15, 2023 Latex Class For TRIUMF Presentations]
\LoadClass[12pt,xcolor=dvipsnames,aspectratio=169]{beamer}

% Packages
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{fontspec}
\RequirePackage{tikz}
\RequirePackage[absolute,overlay]{textpos}

% set font style
\usefonttheme{professionalfonts}
\usefonttheme{serif}
\usepackage{fontspec}
\setmainfont{Helvetica Neue Light}
\setbeamerfont{note page}{family*=pplx,size=\footnotesize} % Palatino for notes
\newfontface\titlefont{HelveticaNeueMedium}
\renewcommand{\textbf}[1]{{\titlefont #1}}

% define TRIUMF color
\definecolor{blue}{HTML}{33B8EF}

% page setup
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}[frame number]
\setbeamerfont{frametitle}{size=\LARGE}
\setbeamercolor{frametitle}{fg=black}
\setbeamercolor{titlelike}{fg=black}

\newcommand{\backupbegin}{
   \newcounter{finalframe}
   \setcounter{finalframe}{\value{framenumber}}
}
\newcommand{\backupend}{
   \setcounter{framenumber}{\value{finalframe}}
}

% make a TRIUMF formatted title/summary slide
% usage: \makebrandedslide{image path}{additional text}
\newcommand*{\makebrandedslide}[2]{
  {
    \setbeamertemplate{footline}{}
    \frame{
      #2

        %TRIUMF logo
        \begin{textblock*}{100mm}(5mm,5mm)
            \includegraphics[keepaspectratio=true,height=0.5cm]{TRIUMF_Logo_Blue.pdf}
        \end{textblock*}

        %TRIUMF image
        \begin{textblock*}{100mm}(93mm,0mm)

            \sbox0{\includegraphics{#1}} % measure size of image
            \Gscale@div\myscalew{55mm}{\wd0}        % calculate scaling factor
            \Gscale@div\myscaleh{90mm}{\ht0}        % calculate scaling factor

            % ensure height is perfect, trim to proper width
            \ifnum\ht0<\wd0
                \includegraphics[keepaspectratio=True,viewport=0 0 0.61\ht0 \ht0, clip=True, scale=\myscaleh]{#1}
            \else
                \includegraphics[keepaspectratio=True,viewport=0 0 \wd0 1.64\wd0, clip=True, scale=\myscalew]{#1}
            \fi
        \end{textblock*}

        % TRIUMF slogan
        \begin{tikzpicture}[overlay,remember picture]
                \node[draw=white,fill=white,rectangle,shift={(-0.145, -2.8)},text width=3cm,above,rotate=90] at (current page.east) {\titlefont{\color{blue} \small Discovery,\\ \vspace{-0.12cm} accelerated}};
        \end{tikzpicture}
    }
  }
}
\makeatother

% Render title slide
% usage: \maketitleslide{title}{date}{name}{image path}
\newcommand*{\maketitleslide}[4]{
  \makebrandedslide{#4}{%
    % title text
    \begin{textblock*}{80mm}(10mm,37mm)
      \large \titlefont{\textcolor{blue}{#1}}
    \end{textblock*}
    %
    % author name
    \begin{textblock*}{100mm}(10mm,65mm)
      {\scriptsize #3}
    \end{textblock*}
    %
    % date
    \begin{textblock*}{100mm}(10mm,85mm)
      {\fontsize{5pt}{5pt}\selectfont #2}
    \end{textblock*}
  }
  \addtocounter{framenumber}{-1}
}

% ---------------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

