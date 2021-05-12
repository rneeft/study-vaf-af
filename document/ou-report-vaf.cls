\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ou-report-vaf}[2014/04/02 v0.1 Open Universiteit report class]

\RequirePackage[english]{babel}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{english}
\ProcessOptions\relax
\LoadClass[12pt]{article}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[nooneline,footnotesize]{caption}
\RequirePackage{fancyhdr}
\RequirePackage[flushmargin,hang]{footmisc}
\RequirePackage{metalogo}
\RequirePackage{tikz}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titletoc}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{xcolor}
\RequirePackage{xkeyval}
\RequirePackage{listings}
\RequirePackage[titletoc]{appendix}
\RequirePackage[T1]{fontenc}    
\RequirePackage{subfigure}
\RequirePackage{graphics}
\RequirePackage{geometry}
\usetikzlibrary{decorations,decorations.pathmorphing,arrows,arrows.meta,automata,trees,backgrounds,petri,shapes,shapes.geometric,quotes,fit,positioning,calc}
\RequirePackage[pagebackref=true,plainpages=false]{hyperref}
\newcommand*\ourmfamily{\rmfamily}
\newcommand*\ousffamily{\sffamily}

%% The native font is Utopia Regular with Fourier math. We use Latin Modern
%% as a fallback, since Utopia lacks support for sans-serif and monospace.
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage{fourier}
%% The style for titles is small caps.
\def\titlefont{\rmfamily}
\def\titleshape{\scshape}
\def\titlestyle{\titlefont\titleshape\bfseries}
\def\headerstyle{\titlefont\titleshape\bfseries}

\setlength{\parindent}{0em}
\setlength{\parskip}{0.5em}

%% Define the OU house style colors.
\definecolor{ou-cyan}{cmyk}{1,0,0,0}
\definecolor{ou-black}{cmyk}{0,0,0,1}
\definecolor{ou-white}{cmyk}{0,0,0,0}
\definecolor{ou-sea-green}{cmyk}{0.54,0,0.32,0}
\definecolor{ou-green}{cmyk}{1,0.15,0.4,0}
\definecolor{ou-dark-blue}{cmyk}{1,0.66,0,0.4}
\definecolor{ou-purple}{cmyk}{0.98,1,0,0.35}
\definecolor{ou-turquoise}{cmyk}{0.82,0,0.21,0.08}
\definecolor{ou-sky-blue}{cmyk}{0.45,0,0.06,0.06}
\definecolor{ou-lavendel}{cmyk}{0.45,0.2,0,0.07}
\definecolor{ou-orange}{cmyk}{0.02,0.56,0.84,0}
\definecolor{ou-warm-purple}{cmyk}{0.58,1,0,0.02}
\definecolor{ou-fuchsia}{cmyk}{0.19,1,0,0.19}
\definecolor{ou-bright-green}{cmyk}{0.36,0,1,0}
\definecolor{ou-yellow}{cmyk}{0.02,0,0.54,0}
\definecolor{ou-red}{cmyk}{0,1,0.88,0.11}

%% Use OU red as the color for titles
\colorlet{title}{ou-red}

%% The affiliation is shown in the blue box on the front cover.
\newcommand*\affiliation[1]{\def\@affiliation{#1}}
%% The cover command is used to specify the filename of the optional cover
%% image.
\newcommand*\coverimage[1]{\def\@cover@image{#1}}
%% The covertext command can be used to specify the text printed on the back
%% cover. This text is inserted in a minipage environment and can therefore
%% include line breaks.
\newcommand\covertext[1]{\def\@cover@text{#1}}

%% The cover image is scaled to fill the width of the front cover.
\newlength\@cover@imagewidth
%% The width of the spine if a back cover is present.
\newlength\@cover@spinewidth
\setlength\@cover@spinewidth{0.375in}
%% Width and height of the boxes on the front and back cover.
\newlength\@cover@frontboxwidth
\setlength\@cover@frontboxwidth{4.375in}
\newlength\@cover@frontboxheight
\setlength\@cover@frontboxheight{2.1875in}
\newlength\@cover@fronttextwidth
\newlength\@cover@fronttextheight
\newlength\@cover@backboxwidth
\setlength\@cover@backboxwidth{4.375in}
\newlength\@cover@backboxheight
\setlength\@cover@backboxheight{2.1875in}
\newlength\@cover@backtextwidth
\newlength\@cover@backtextheight
%% Position on the front cover where the corner of both boxes meet.
\newlength\@cover@x
\setlength\@cover@x{0.8125in}
\newlength\@cover@y
\setlength\@cover@y{3in}
%% The margin around text boxes.
\newlength\@cover@margin
\setlength\@cover@margin{12pt}

%% Define the options for the makecover command.
\define@boolkey{cover}{back}[true]{}
\define@boolkey{cover}{nospine}[true]{}
\define@boolkey{cover}{frontbottom}[true]{}
\define@key{cover}{spinewidth}{\setlength\@cover@spinewidth{#1}}
\define@key{cover}{frontboxwidth}{\setlength\@cover@frontboxwidth{#1}}
\define@key{cover}{frontboxheight}{\setlength\@cover@frontboxheight{#1}}
\define@key{cover}{backboxwidth}{\setlength\@cover@backboxwidth{#1}}
\define@key{cover}{backboxheight}{\setlength\@cover@backboxheight{#1}}
\define@key{cover}{x}{\setlength\@cover@x{#1}}
\define@key{cover}{y}{\setlength\@cover@y{#1}}
\define@key{cover}{margin}{\setlength\@cover@margin{#1}}


%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
    \clearpage%
    \if@twoside%
        \ifodd\c@page%
        \else%
            \thispagestyle{empty}%
            \vspace*{\fill}%
            \newpage%
        \fi%
    \fi%
}

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyfoot[C]{\titlefont\thepage}
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
    \fancyhf{}
    %% Page numbers on the top left and top right.
    \fancyhead[L,R]{\titlefont\thepage}
    %% Chapter name on the left (even) page.
    \fancyhead[R]{\titlefont\titleshape\nouppercase{\leftmark}}
    %% Section name on the right (odd) page.
    \fancyhead[L]{\titlefont\titleshape\nouppercase{\rightmark}}
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}


%% The setheader command can be used to print the title of unnumbered chapters
%% in the page header.
\newcommand*\setheader[1]{\markboth{\color{title}#1}{\color{title}#1}}

\setlength{\headheight}{15pt}

%% Change the headrule command (from fancyhdr.sty) to draw the line below the
%% header in the title color.
\renewcommand*\headrule{%
    \if@fancyplain%
        \let\headrulewidth\plainheadrulewidth%
    \fi%
    {\color{title}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth%
}

%% Draw the line above a footnote in the title color as well.
\renewcommand*\footnoterule{%
    \vspace*{-3pt}%
    {\color{title}\hrule width 0.5\textwidth height 0.4pt}%
    \vspace*{2.6pt}%
}

%% A part title starts with a huge (96pt) bold black number, flushed to the
%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
    {\flushright\titlestyle}
    {\fontsize{96pt}{96pt}\selectfont\bfseries\thepart}
    {0pt}
    {\Huge\color{title}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}


%% Section titles start with the number in bold, followed by the name printed
%% in the title color.
\titleformat{\section}
    {\Large\headerstyle}
    {\bfseries\color{title}\thesection.\ }
    {0pt}
    {\color{title}}
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
%% In the table of contents, section names are followed by a line of dots 8pt
%% apart.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller
%% font.
\titleformat{\subsection}
    {\large\headerstyle}
    {\bfseries\color{title}\thesubsection.\ }
    {0pt}
    {\color{title}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections, but
%% are not preceded by a number.
\titleformat{\subsubsection}
    {\headerstyle}
    {\bfseries\color{title}\thesubsubsection.\ }
    {0pt}
    {\color{title}}
%% Subsubsections are preceded by an empty line and do not appear in the table
%% of contents.
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}
\dottedcontents{subsubsection}[9em]{\titlefont}{3.2em}{8pt}


%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{title}\textbullet}
\renewcommand*\labelitemii{\color{title}--}
\renewcommand*\labelitemiii{\color{title}$\diamond$}
\renewcommand*\labelitemiv{\color{title}\textperiodcentered}

%% Hyperlinks are title color, except in print mode, when they are all black.
\hypersetup{
    colorlinks = true,
    citecolor = title,
    linkcolor = title,
    urlcolor = title
}

\RequirePackage{csquotes}

%% adding a style for code
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{ou-white},   
    commentstyle=\color{ou-green},
    keywordstyle=\color{ou-red},
    numberstyle=\tiny\color{ou-red},
    stringstyle=\color{ou-purple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}
\lstset{style=mystyle}