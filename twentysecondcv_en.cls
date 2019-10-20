\ProvidesClass{twentysecondcv}[2017/01/08 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------
%HiK121------------------------
\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{calc} %calculations (in this case to calculate width of text)
\RequirePackage{enumitem}% enumeration package - to remove vertical spacing during enumeration
\RequirePackage{fontawesome}%for LinkedIn icon
\usepackage{varwidth} %to variable width of text for enumeration on left bar
%next 3 for starskills
\let\lll\undefined
\usepackage{scalerel}
\usepackage{amssymb}

%to here-----------------------


\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1.05cm} % Left margin
\setlength{\TPVertModule}{0.8cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{8pt}% Whitespace before the section title
	{\color{black!80} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}} %LinkedIn site
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}} %GitHub site
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\skills[1]{ 
	\renewcommand{\skills}{
		\foreach [count=\i] \x/\y in {#1}{
			\begin{tikzpicture}
				\draw[fill=maingray,maingray] (0,0) rectangle (6.3,0.4);
				\draw[fill=white,mainblue](0,0) rectangle (\y,0.4)
				node (example-varwidth) [above right, color = black] at (0,0.4) {\begin{varwidth}{6.3 cm}\x \end{varwidth}};
			\end{tikzpicture}
		}
	}
}

% Command for printing skills text
\newcommand\skillstext[1]{ 
	\renewcommand{\skillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{ 
				\x$ \star $\y
			}
		\end{flushleft}
	}
}
%HiK121 -----------------

\newcommand\stars[1]{%
	\ifthenelse{\equal{#1}{1}}{\makebox[\width]{\fontsize{4.5}{10}\selectfont\centering ${}^{\bigstar}$}}{}%
	%
	\ifthenelse{\equal{#1}{2}}{\fontsize{4.5}{10}\selectfont\centering ${}^{\bigstar \bigstar}$}{}%
	%
	\ifthenelse{\equal{#1}{3}}{\raisebox{.5ex}{\fontsize{4.5}{10}\selectfont\centering ${}^{\bigstar \bigstar}_{\hspace{.7ex}\bigstar}$}}{}%
	%
	\ifthenelse{\equal{#1}{4}}{\makebox[\width]{\raisebox{.5ex}{{\fontsize{4.5}{10}\selectfont\centering ${}^{\bigstar \bigstar}_{\bigstar \bigstar}$}}}}{}%
	%
	\ifthenelse{\equal{#1}{5}}{\raisebox{.5ex}{{\fontsize{4.5}{10}\selectfont\centering ${}^{\bigstar \bigstar \bigstar}_{\hspace{.7ex}\bigstar \bigstar}$}}}{}%
	%
}%

% Command for printing skills text
\newcommand\startext[1]{
	\renewcommand{\startext}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{
				\ifthenelse{\equal{\y}{1}}{\makebox[\width]{{\stars{1}}\normalsize\x}}{}%
				%
				\ifthenelse{\equal{\y}{2}}{\makebox[\width]{{\stars{2}}\normalsize\x}}{}%
				\ifthenelse{\equal{\y}{3}}{\makebox[\width]{{\stars{3}}\normalsize\x}}{}%
				%
				\ifthenelse{\equal{\y}{4}}{\makebox[\width]{{\stars{4}}\normalsize\x}}{}%
				%
				\ifthenelse{\equal{\y}{5}}{\makebox[\width]{{\stars{5}}\normalsize\x}}{}%
				%
				\ifthenelse{\equal{\y}{}}{\normalsize\x}{}% if there is no star value
				\ifthenelse{\equal{\x}{_}}{\newline}{}%
				%if underscore, then generate new line
			}%
		\end{flushleft}%
		\ifthenelse{\equal{#1}{}}{}{
		\stars{1} \hfill \stars{2} \hfill \stars{3} \hfill \stars{4} \hfill \stars{5} % \hfill
		}%
		
	}%
}%

%Command for languages skills
\newcommand\languages[1]{ 
	\renewcommand{\languages}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{ 
				 \x  \hfill{\y}  \par
			}
			%{#1}
		\end{flushleft}
	}
}

%Command for certificates
\newcommand\certificates[1]{ 
	\renewcommand{\certificates}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{ 
				 \x  \hfill{\y}  \par
			}
			\hfill valid to \par
		\end{flushleft}
	}
}

%to here-----------------------

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.2)
			
		%------------------------------------------------
		
		\ifthenelse{\equal{\profilepic}{}}{}{
			\begin{center}
				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
					\clip (100, 50) rectangle (600, 650);
					\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
				\end{tikzpicture}
			\end{center}
		}

		%------------------------------------------------

		{\Huge\color{mainblue}\cvname}

		%------------------------------------------------

		{\Large\color{black!80}\cvjobtitle}

		%------------------------------------------------

		\renewcommand{\arraystretch}{1.6}
		\begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvdate}{}}{}{\textsc{\Large\icon{\Heart}} & \cvdate\\}
			%\ifthenelse{\equal{\cvaddress}{}}{}{\textsc{\Large\icon{\Letter}} & \cvaddress\\}
			\ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\Large\icon{\Telefon}} & \cvnumberphone\\}
			%\ifthenelse{\equal{\cvsite}{}}{}{\textsc{\Large\icon{\Mundus}} & \cvsite\\}
			\ifthenelse{\equal{\cvmail}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\cvmail}{\cvmail}\\}
			\ifthenelse{\equal{\cvlinkedin}{}}{}{\textsc{\huge\raisebox{-0.4 em}{\textcolor{mainblue}{\faLinkedinSquare} }} & \href{http://\cvlinkedin}{\cvlinkedin}\\}
			\ifthenelse{\equal{\cvgithub}{}}{}{\textsc{\huge\raisebox{-0.2 em}{\textcolor{mainblue}{\faGithub} }}  & \href{http://\cvgithub}{\cvgithub}\\}
		\end{tabular}

		%------------------------------------------------
		
		% \ifthenelse{\equal{\aboutme}{}}{}{
			% \profilesection{About me}
			% \begin{flushleft}
				% \aboutme
			% \end{flushleft}
		% }

		%------------------------------------------------

		\profilesection{Skills}

		\skills
		\skillstext
		\startext

		\normalsize
		[Basics \hfill Expert]%\hfill
		
		%HiK121------------------
		
		\profilesection{Languages}
		\languages
		
		\profilesection{Certificates}
		\certificates
		
			
		%to here--------------------------------
			
	\end{textblock}
}

%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, minimum width = 13 cm, fill=#2,#2,text=white](char){#1};%
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
	{%
		\round{#1}{mainblue}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\color{gray}%
		\Large\sectioncolor{#1}%
		\par\vspace{.5\parskip}
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{p{2cm} @{\extracolsep{\fill}} l}

	}{%
	\end{tabular*}
	\vspace{-10pt}
}


 \newcommand{\twentyitem}[4]{%
	\raggedright{#1} & \begin{minipage}[t]{0.85\textwidth}{%
		\begin{tabular*}{\textwidth}[t]{l @{\extracolsep{\fill}}l}
			 \parbox[t]{0.35\textwidth}{\raggedright\textbf{#2}} &
			 \parbox[t]{0.6\textwidth}{\raggedleft\large{#3}}
		 \end{tabular*}
		 \par % 
		 {#4}\vspace{\parsep}%
	 }\end{minipage}
	 \\
 }

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}[t]{p{2cm} @{\extracolsep{\fill}} l}
}{%
	\end{tabular*}
	\vspace{-10pt}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.85\textwidth}{%
		\par%	
		{#2}\vspace{\parsep}%
	}\\
}


%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.0cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

\RequirePackage{hyperref}
