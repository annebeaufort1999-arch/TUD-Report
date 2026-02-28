\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tudelft-report}[2013/06/22 v1.0 TU Delft thesis class]

\newif\if@dutch
\newif\if@english
\newif\if@nativefonts
\newif\if@print
\newif\if@roman
\@romantrue
\DeclareOption{dutch}{\@dutchtrue\@englishfalse}
\DeclareOption{roman}{\@romantrue}
\DeclareOption{noroman}{\@romanfalse}
\DeclareOption{english}{\@dutchfalse\@englishtrue}
\DeclareOption{nativefonts}{\@nativefontstrue}
\DeclareOption{print}{\@printtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{english}
\ProcessOptions\relax

\LoadClass[10pt]{book}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\if@dutch
    \RequirePackage[dutch]{babel}
\else
    \RequirePackage[dutch,english]{babel}
\fi
\RequirePackage[nooneline,footnotesize]{caption}
\RequirePackage{fancyhdr}
\RequirePackage[flushmargin,hang]{footmisc}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\ifxetex
    \RequirePackage[xetex]{geometry}
    \RequirePackage[xetex]{graphicx}
    \RequirePackage[xetex]{hyperref}
    \RequirePackage{fontspec}
    \RequirePackage{xltxtra}
    \defaultfontfeatures{Ligatures=TeX}
\else
    \ifpdf
        \RequirePackage[pdftex]{geometry}
        \RequirePackage[pdftex]{graphicx}
        \RequirePackage[pdftex]{hyperref}
    \else
        \RequirePackage[dvips]{geometry}
        \RequirePackage[dvips]{graphicx}
        \RequirePackage[hypertex]{hyperref}
    \fi
\fi
\RequirePackage{metalogo}
\RequirePackage{tikz}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{xcolor}
\RequirePackage{xkeyval}
\RequirePackage[export]{adjustbox}
\def\@largetitlesize{96pt}

\ifxetex
    \newfontfamily\tudtitlefamily[
        Path = fonts/,
        Extension = .ttf%,
    ]{TUDelft-UltraLight}
    \newfontfamily\tudrmfamily[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *_Bold,
        ItalicFont = *_Italic,
        BoldItalicFont = *_Bold_Italic]{Georgia}
    \newfontfamily\tudsffamily[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *_Bold,
        ItalicFont = *_Italic,
        BoldItalicFont = *_Bold_Italic]{Arial}
\else
    \@nativefontstrue
    \newcommand*\tudrmfamily{\rmfamily}
    \newcommand*\tudsffamily{\sffamily}
\fi

\if@nativefonts
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \if@roman
      \RequirePackage[thin]{roboto}
      \RequirePackage{fourier}
    \else
      \RequirePackage[thin]{roboto}
      \RequirePackage{helvet}
      \renewcommand{\familydefault}{\sfdefault}
    \fi
    \def\largetitlefont{\fontfamily{Roboto-LF}}
    \def\largetitleseries{\fontseries{t}}
    \def\largetitleshape{\fontshape{n}}
    \def\largetitlestyle{\largetitlefont\largetitleseries\largetitleshape}
    \def\titleshape{\fontshape{n}}
    \if@roman
        \renewcommand{\familydefault}{\rmdefault}
        \def\titlefont{\fontfamily{fla}}
        \def\sectitleshape{\fontshape{n}}
        \def\sectitlestyle{\rmfamily\titleshape\bfseries}
        \def\chaptitlestyle{\rmfamily\titleshape}
    \else
        \def\titlefont{\fontfamily{fla}}
        \def\sectitlestyle{\sffamily\titleshape\bfseries}
        \def\chaptitlestyle{\sffamily\titleshape}
    \fi
    \def\titlestyle{\titlefont\titleshape}
    \def\headerstyle{\titlefont}
\else
    \RequirePackage{unicode-math}
    \setmainfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]{BookmanOldStyle}
    \setsansfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *_Bold,
        ItalicFont = *_Italic,
        BoldItalicFont = *_Bold_Italic]{Arial}
    \setmonofont[
        Path = fonts/,
        Extension = .ttf,
        UprightFont = *MT,
        BoldFont = *-BoldMT,
        ItalicFont = *-ItalicMT,
        BoldItalicFont = *-BoldItalicMT
    ]{CourierNewPS}
    \setmathfont[
        Path = fonts/,
        Extension = .ttf
    ]{CambriaMath}
    \renewcommand*\familydefault{\sfdefault}
    \def\titlefont{\tudsffamily}
    \def\largetitlefont{\tudtitlefamily}
    \def\titleshape{}
    \def\largetitleshape{\titleshape}
    \def\largetitleseries{}
    \def\largetitlestyle{\largetitlefont\largetitleseries\largetitleshape}
    \def\chaptitlefamily{\tudsffamily}
    \def\titlestyle{\titlefont\titleshape}
    \def\sectitlestyle{\tudsffamily\titleshape\bfseries}
    \def\chaptitlestyle{\chaptitlefamily}
    \def\headerstyle{\titlestyle}
\fi

\renewenvironment{quote}
               {\list{}{\rightmargin\leftmargin}\tudrmfamily\selectfont%
                \item\relax}
               {\endlist}

\definecolor{tudelft-cyan}{cmyk}{1,0,0,0}
\definecolor{tudelft-black}{cmyk}{0,0,0,1}
\definecolor{tudelft-white}{cmyk}{0,0,0,0}
\definecolor{tudelft-sea-green}{cmyk}{0.54,0,0.32,0}
\definecolor{tudelft-green}{cmyk}{1,0.15,0.4,0}
\definecolor{tudelft-dark-blue}{cmyk}{1,0.66,0,0.4}
\definecolor{tudelft-purple}{cmyk}{0.98,1,0,0.35}
\definecolor{tudelft-turquoise}{cmyk}{0.82,0,0.21,0.08}
\definecolor{tudelft-sky-blue}{cmyk}{0.45,0,0.06,0.06}
\definecolor{tudelft-lavendel}{cmyk}{0.45,0.2,0,0.07}
\definecolor{tudelft-orange}{cmyk}{0.02,0.56,0.84,0}
\definecolor{tudelft-warm-purple}{cmyk}{0.58,1,0,0.02}
\definecolor{tudelft-fuchsia}{cmyk}{0.19,1,0,0.19}
\definecolor{tudelft-bright-green}{cmyk}{0.36,0,1,0}
\definecolor{tudelft-yellow}{cmyk}{0.02,0,0.54,0}

\def\@pagecolor{tudelft-cyan}
\colorlet{title}{black}

\geometry{a4paper,hscale=0.75,vscale=0.8}

\renewcommand*\title[2][tudelft-white]{%
    \def\@titlecolor{#1}%
    \def\@title{#2}%
    \hypersetup{pdftitle=#2}%
}
\newcommand*\subtitle[2][tudelft-white]{%
    \def\@subtitlecolor{#1}%
    \def\@subtitle{#2}%
}
\renewcommand*\author[2][tudelft-white]{%
    \def\@authorcolor{#1}%
    \def\@author{#2}%
    \hypersetup{pdfauthor=#2}%
}
\newcommand*\affiliation[2][tudelft-white]{%
    \def\@afilcolor{#1}%
    \def\@affiliation{#2}%
}
\newcommand*\coverimage[1]{\def\@cover@image{#1}}
\newcommand\covertext[2][tudelft-white]{%
    \def\@covertextcolor{#1}%
    \def\@cover@text{#2}%
}

\newlength\@cover@imagewidth
\newlength\@cover@spinewidth
\setlength\@cover@spinewidth{0.375in}
\newlength\@cover@frontboxwidth
\setlength\@cover@frontboxwidth{4.375in}
\newlength\@cover@frontboxheight
\setlength\@cover@frontboxheight{2.1875in}
\newlength\@cover@fronttextwidth
\newlength\@cover@fronttextheight
\newlength\@cover@splitboxwidth
\setlength\@cover@splitboxwidth{6.375in}
\newlength\@cover@splitboxheight
\setlength\@cover@splitboxheight{0.5\paperheight}
\newlength\@cover@splitboxtextwidth
\newlength\@cover@splittextheight
\newlength\@cover@x
\setlength\@cover@x{0.8125in}
\newlength\@cover@y
\setlength\@cover@y{3in}
\newlength\@cover@ax
\setlength\@cover@ax{0.6125in}
\newlength\@cover@ay
\setlength\@cover@ay{5in}
\newlength\@cover@margin
\setlength\@cover@margin{12pt}

\define@boolkey{cover}{back}[true]{}
\define@boolkey{cover}{split}[true]{}
\define@boolkey{cover}{nospine}[true]{}
\define@boolkey{cover}{frontbottom}[true]{}
\define@boolkey{cover}{whitelogo}[true]{}
\define@key{cover}{spinewidth}{\setlength\@cover@spinewidth{#1}}
\define@key{cover}{frontboxwidth}{\setlength\@cover@frontboxwidth{#1}}
\define@key{cover}{frontboxheight}{\setlength\@cover@frontboxheight{#1}}
\define@key{cover}{x}{\setlength\@cover@x{#1}}
\define@key{cover}{y}{\setlength\@cover@y{#1}}
\define@key{cover}{ax}{\setlength\@cover@ax{#1}}
\define@key{cover}{ay}{\setlength\@cover@ay{#1}}
\define@key{cover}{margin}{\setlength\@cover@margin{#1}}
\newcommand\titleoffsetx[1]{\def\@cover@x{#1}}
\newcommand\titleoffsety[1]{\def\@cover@y{#1}}
\newcommand\afiloffsetx[1]{\def\@cover@ax{#1}}
\newcommand\afiloffsety[1]{\def\@cover@ay{#1}}
\newcommand\setpagecolor[1]{\def\@pagecolor{#1}}

\newcommand*\makecover[1][]{%
    \setkeys{cover}{#1}%
    \clearpage
    \newgeometry{margin=0pt}
    \pagecolor{\@pagecolor}
    \thispagestyle{empty}
    \usetikzlibrary{calc}
    \begin{tikzpicture}[remember picture,overlay]
        \ifKV@cover@nospine
            \setlength\@cover@spinewidth{0pt}
        \fi
        \ifKV@cover@back
            \setlength\@cover@imagewidth{0.5\paperwidth}
            \addtolength\@cover@imagewidth{0.5\@cover@spinewidth}
        \else
            \setlength\@cover@imagewidth{\paperwidth}
        \fi
        \ifx\@cover@image\undefined\else
            \ifKV@cover@back
                \ifKV@cover@split
                    \node[anchor=north west,inner sep=0pt] at (current page.center)
                        {\includegraphics[width=\@cover@imagewidth]{\@cover@image}};
                \else
                    \node at (current page.north east)[anchor=north east,inner sep=0pt]
                        {\includegraphics[width=\@cover@imagewidth]{\@cover@image}};
                \fi
            \else
                \ifKV@cover@split
                    \node[anchor=north west,inner sep=0pt] at (current page.west)
                        {\includegraphics[width=\@cover@imagewidth]{\@cover@image}};
                \else
                    \node at (current page.north east)[anchor=north east,inner sep=0pt]
                        {\includegraphics[width=\@cover@imagewidth]{\@cover@image}};
                \fi
            \fi
        \fi
        \ifKV@cover@whitelogo
            \ifKV@cover@back
                \node at (current page.south west)[anchor=south west,inner sep=20pt]
                    {\includegraphics{cover/logo_white}};
                \node at (current page.south east)[anchor=south east,inner sep=20pt]
                    {\includegraphics{cover/logo_white}};
            \else
                \node at (current page.south west)[anchor=south west,inner sep=20pt]
                    {\includegraphics{cover/logo_white}};
            \fi
        \else
            \ifKV@cover@back
                \node at (current page.south west)[anchor=south west,inner sep=20pt]
                    {\includegraphics{cover/logo_black}};
                \node at (current page.south east)[anchor=south east,inner sep=20pt]
                    {\includegraphics{cover/logo_black}};
            \else
                \node at (current page.south west)[anchor=south west,inner sep=20pt]
                    {\includegraphics{cover/logo_black}};
            \fi
        \fi
        \ifKV@cover@back
            \coordinate (top left) at ($(current page.north)+(0.5\@cover@spinewidth,0pt)$);
        \else
            \coordinate (top left) at (current page.north west);
        \fi
        \ifKV@cover@back
            \coordinate (bottom left) at ($(current page.south)+(0.5\@cover@spinewidth,0pt)$);
        \else
            \coordinate (bottom left) at (current page.south west);
        \fi
        \ifKV@cover@back\ifKV@cover@nospine\else
            \coordinate (spine top left) at ($(top left)-(\@cover@spinewidth,0pt)$);
            \coordinate (spine bottom right) at ($(top left)+(0pt,-\@cover@y)$);
            \ifKV@cover@frontbottom
                \coordinate (spine bottom right) at ($(spine bottom right)+(0pt,\@cover@backboxheight)$);
            \fi
            \coordinate (spine bottom center) at ($(spine bottom right)+(-0.5\@cover@spinewidth,0pt)$);
            \coordinate (spine top left) at ($(spine top left)-(1pt,0pt)$);
            \fill[fill=tudelft-black](spine top left) rectangle (spine bottom right);
            \node at (spine bottom center)[rotate=-90,anchor=east,inner sep=\@cover@margin]{
                \tudsffamily\color{tudelft-white}\LARGE\@title
            };
        \fi\fi
        \ifKV@cover@split
            \setlength\@cover@fronttextwidth{\@cover@splitboxwidth}
            \addtolength\@cover@fronttextwidth{-2\@cover@margin}
            \setlength\@cover@fronttextheight{\@cover@splitboxheight}
            \addtolength\@cover@fronttextheight{-4\@cover@margin}
            \coordinate (tcorner) at ($(top left)+(2\@cover@margin,-2\@cover@margin)$);
            \coordinate (front top left) at (tcorner);
            \node at (front top left)[anchor=north west,inner sep=\@cover@margin]{%
                \begin{minipage}[t][\@cover@fronttextheight]{\@cover@fronttextwidth}
                    {\titlefont\color{\@titlecolor}\fontsize{40}{46}\selectfont AI Ethics\\[2mm]in Energy Transitions}%
                    \ifx\@subtitle\undefined\else
                        \\[6mm]%
                        {\titlefont\color{tudelft-black}\fontsize{22}{26}\selectfont\@subtitle}%
                    \fi
                    \vfill
                    {\titlefont\color{\@authorcolor}\fontsize{16}{20}\selectfont\@author}%
                    \ifx\@cover@text\undefined\else
                        \\[2mm]%
                        {\titlefont\color{\@covertextcolor}\fontsize{13}{16}\selectfont\@cover@text}%
                    \fi
                \end{minipage}%
            };
        \else
            \coordinate (tcorner) at ($(top left)+(\@cover@x,-\@cover@y)$);
            \coordinate (acorner) at ($(top left)+(\@cover@ax,-\@cover@ay)$);
            \ifKV@cover@frontbottom
                \coordinate (front top left) at (tcorner);
                \coordinate (back top left) at ($(tcorner)+(-\@cover@splitboxwidth,\@cover@splitboxheight)$);
            \else
                \coordinate (front top left) at ($(tcorner)+(0pt,\@cover@frontboxheight)$);
                \coordinate (back top left) at ($(tcorner)+(-\@cover@splitboxwidth,0pt)$);
            \fi
            \coordinate (front bottom right) at ($(front top left)+(\@cover@frontboxwidth,-\@cover@frontboxheight)$);
            \coordinate (back bottom right) at ($(back top left)+(\@cover@splitboxwidth,-\@cover@splitboxheight)$);
            \setlength\@cover@fronttextwidth{\@cover@frontboxwidth}
            \addtolength\@cover@fronttextwidth{-2\@cover@margin}
            \setlength\@cover@fronttextheight{\@cover@frontboxheight}
            \addtolength\@cover@fronttextheight{-2\@cover@margin}
            \node at (front top left)[anchor=north west,inner sep=\@cover@margin]{%
                \begin{minipage}[t][\@cover@fronttextheight]{\@cover@fronttextwidth}
                    {\largetitlestyle\color{\@titlecolor}\fontsize{96}{96}\selectfont\@title}%
                    \ifx\@subtitle\undefined\else
                        \\[3mm]%
                        {\tudsffamily\color{\@subtitlecolor}\fontsize{22}{32}\selectfont\@subtitle}%
                    \fi
                    \vfill
                    {\largetitlestyle\color{\@authorcolor}\fontsize{26}{26}\selectfont\@author}%
                \end{minipage}%
            };
            \ifx\@affiliation\undefined\else
                \node at (acorner)[rotate=90,anchor=south west,inner sep=\@cover@margin]{%
                    \tudsffamily\color{\@afilcolor}\@affiliation
                };
            \fi
        \fi
    \end{tikzpicture}
    \restoregeometry
    \pagecolor{white}
}

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

\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyfoot[C]{\titlefont\thepage}
}

\fancypagestyle{mainmatter}{%
    \fancyhf{}
    \fancyhead[LE,RO]{\titlefont\titleshape\thepage}
    \fancyhead[RE]{\titlefont\titleshape\nouppercase{\leftmark}}
    \fancyhead[LO]{\titlefont\titleshape\nouppercase{\rightmark}}
}

\pagestyle{mainmatter}

\renewcommand*\chaptermark[1]{\markboth{\thechapter.\ \color{title}#1}{}}
\renewcommand*\sectionmark[1]{\markright{\thesection.\ \color{title}#1}}
\newcommand*\setheader[1]{\markboth{\color{title}#1}{\color{title}#1}}

\renewcommand*\headrule{%
    \if@fancyplain%
        \let\headrulewidth\plainheadrulewidth%
    \fi%
    {\color{title}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth%
}

\renewcommand*\footnoterule{%
    \vspace*{-3pt}%
    {\color{title}\hrule width 0.5\textwidth height 0.4pt}%
    \vspace*{2.6pt}%
}

\titleformat{\part}[display]
    {\flushright}
    {\fontsize{\@largetitlesize}{\@largetitlesize}\selectfont\bfseries\thepart}
    {0pt}
    {\Huge\color{title}}
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

\titleformat{\chapter}[display]
    {\flushright\largetitlestyle}
    {\fontsize{96}{96}\selectfont\thechapter}
    {0pt}
    {\chaptitlestyle\Huge\color{title}}
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

\titleformat{\section}
    {\Large\sectitlestyle}
    {\bfseries\thesection.\ }
    {0pt}
    {\color{title}}
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

\titleformat{\subsection}
    {\large\sectitlestyle}
    {\bfseries\thesubsection.\ }
    {0pt}
    {\color{title}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

\titleformat{\subsubsection}
    {\headerstyle}
    {}
    {0pt}
    {\color{title}}
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}

\renewcommand*\labelitemi{\color{title}\textbullet}
\renewcommand*\labelitemii{\color{title}--}
\renewcommand*\labelitemiii{\color{title}$\diamond$}
\renewcommand*\labelitemiv{\color{title}\textperiodcentered}

\hypersetup{
    colorlinks=true,
    citecolor=title,
    linkcolor=title,
    urlcolor=title
}