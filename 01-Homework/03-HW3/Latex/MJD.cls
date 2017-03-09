\ProvidesClass{MJD}[9/10/2012 A custom .cls file for writing academic papers authored by Matthew Denny]
\NeedsTeXFormat{LaTeX2e} % Tells the computer to use LaTeX2e formatting
\LoadClass{report} % this class is a modified version of the standard Article class
%\fontsize{16pt}{16pt}
%\selectfont

%BELOW IS A SAMPLE DOCUMENT WITH PREAMBLE
%\documentclass[fleqn]{MJD}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\begin{document}
%\titleAT[Testing the MJD.cls file]{Matthew Denny}
%\end{document}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%these packages ive you access to a whole bunch of different fonts and alot of functionality, if you need to add a package that is required for doing something you want to do, put it below
%The etx package need to be the first loaded
\usepackage{etex}


%\usepackage[latin1]{inputenc}
%\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage{amsmath,amssymb,amsfonts,amsthm,textcomp}
\usepackage{tipa}
\usepackage{listings}
\usepackage{bm}
\usepackage{subfigure} 
\usepackage{mathabx}
\usepackage{multirow}
\usepackage{setspace}
\usepackage{verbatim}
\usepackage{fullpage}
\usepackage{bbm}
\usepackage{setspace}
\usepackage{tabularx}
\newcolumntype{Y}{>{\small\raggedright\arraybackslash}X}
\usepackage{hhline}
\usepackage[normalem]{ulem}
\usepackage{booktabs}
\usepackage{array}
\usepackage{datetime}
\usepackage{charter}
\usepackage{float,moresize}
%\these packages enable landscape documents
%\usepackage[landscape]{geometry}

\usepackage[round]{natbib}
%\usepackage[natbib=true,style=verbose-ibid,isbn=false]{biblatex}
\usepackage{cite}
%\renewcommand\citeleft{} 
%\renewcommand\citeright{}
\let\cite\citeyearpar

%my actual bibliograhpy chunk
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%\bibliographystyle{achemso}
%%abbrvnat, unsrtnat, MJD_plainnat.bst
%%\bibliographystyle{elsart-harv}
%\hypersetup{linkcolor=black}
%\bibliographystyle{MJD_plainnat}
%%\printbibliography
%\bibliography{library}




\usepackage[activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=10,shrink=10]{microtype}
% activate={true,nocompatibility} - activate protrusion and expansion
% final - enable microtype; use "draft" to disable
% tracking=true, kerning=true, spacing=true - activate these techniques
% factor=1100 - add 10% to the protrusion amount (default is 1000)
% stretch=10, shrink=10 - reduce stretchability/shrinkability (default is 20/20)


%to create check marks and x's
\usepackage{pifont}% http://ctan.org/pkg/pifont
\newcommand{\cmark}{\hspace{3pt} \fbox{\textbf{\color{darkgreen}\ding{51}}} \hspace{3pt}}%
\newcommand{\xmark}{ \hspace{3pt} \fbox{\textbf{\color{red}\ding{55}}} \hspace{3pt}}%
\newcommand{\sortof}{ \hspace{3pt} \fbox{\textbf{\color{yellow}$\sim$}} \hspace{3pt}}%


%create a blank footnote with no number
\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}


%this one lets you make only part of a documnet landscape (so a few charts etc.)
\usepackage{lscape}
%\begin{landscape}
% your stuff here
%\end{landscape}

%allows us to remove page numbering
%\usepackage{nopageno}

% \doublespacing

% Color package and define colors
\usepackage{color, colortbl}
%\usepackage{xcolor}
\usepackage[usenames,dvipsnames]{xcolor}
\definecolor{darkblue}{rgb}{.1,0,.5}
\definecolor{brightblue}{rgb}{0,0,1}
\definecolor{darkgreen}{RGB}{0,100,0}
\definecolor{orange}{RGB}{255,127,0}
\definecolor{shadecolor}{rgb}{.9, .9, .9}
\definecolor{verbgray}{gray}{0.9}


%lets us put bold font in verbatim
\usepackage{fancyvrb}
\newcommand\verbbf[1]{\textcolor[rgb]{0,0,1}{\textbf{$\blacksquare$ #1}}}
\newcommand\verbrf[1]{\textcolor[rgb]{1,0,0}{\textbf{$\blacksquare$ #1}}}

%this is how to use it
%\begin{Verbatim}[commandchars=\\\{\}]
%64787 E # 7212 t 5.522991476131 m 20 ce 7211 msg 10
%64788 - 5.522991476131 handleLowerControl contention
%\verbbf{64789 - 5.522991476131 suspend contention: began 5.522950381231, would end 5.523126381231, ifs 0.000176, quiet time 0.0000410949}
%64790 - suspended during D/E/A IFS (no backoff)
%64791 - suspended backoff timer, remaining backoff time: 0
%\end{Verbatim}

% Alternate bibliography styles
% \usepackage{natbib}
% \bibliographystyle{apalike}

% Hyper Reference Formatting
%\usepackage[pagebackref]{hyperref}
\usepackage{hyperref}
\hypersetup{colorlinks,breaklinks,
            linkcolor=darkblue,urlcolor=darkblue,
            anchorcolor=darkblue,citecolor=black}
            
%%%% these patches ensure that the backrefs point to the actual occurrences of the citations in the text, not just the page or section in which they appeared
%%%% http://tex.stackexchange.com/questions/54541/precise-back-reference-target-with-hyperref-and-backref
%%%%% BEGIN BACKREF DIRECT PATCH, apply these AFTER loading hyperref package with appropriate backref option
%% The following options are provided for the patch, currently with a poor interface!
%% * If there are multiple cites on the same (page|section) (depending on backref mode),
%%   should we show only the first one or should we show them all?
%\newif\ifbackrefshowonlyfirst
%\backrefshowonlyfirstfalse
%%\backrefshowonlyfirsttrue
%%%%% end of options
%%
%% hyperref is essential for this patch to make any sense, so it is not unreasonable to request it be loaded before applying the patch
%\makeatletter
%% 1. insert a phantomsection before every cite, so hyperref has something to target
%%    * in case natbib is loaded. hyperref provides an appropriate hook so this should be safe, and we don't even need to check if natbib is loaded!
%\let\BR@direct@old@hyper@natlinkstart\hyper@natlinkstart
%\renewcommand*{\hyper@natlinkstart}{\phantomsection\BR@direct@old@hyper@natlinkstart}% note that the anchor will appear after any brackets at the start of the citation, but that's not really a big issue?
%%    * if natbib isn't used, backref lets \@citex to \BR@citex during \AtBeginDocument
%%      so just patch \BR@citex
%\let\BR@direct@oldBR@citex\BR@citex
%\renewcommand*{\BR@citex}{\phantomsection\BR@direct@oldBR@citex}%
%
%% 2. if using page numbers, show the page number but still hyperlink to the phantomsection instead of just the page!
%\long\def\hyper@page@BR@direct@ref#1#2#3{\hyperlink{#3}{#1}}
%
%% check which package option the user loaded (pages (hyperpageref) or sections (hyperref)?)
%\ifx\backrefxxx\hyper@page@backref
%    % they wanted pages! make sure they get our re-definition
%    \let\backrefxxx\hyper@page@BR@direct@ref
%    \ifbackrefshowonlyfirst
%        %\let\backrefxxxdupe\hyper@page@backref% test only the page number
%        \newcommand*{\backrefxxxdupe}[3]{#1}% test only the page number
%    \fi
%\else
%    \ifbackrefshowonlyfirst
%        \newcommand*{\backrefxxxdupe}[3]{#2}% test only the section name
%    \fi
%\fi
%
%% 3. now make sure that even if there is no numbered section, the hyperref's still work instead of going to the start of the document!
%\RequirePackage{etoolbox}
%\patchcmd{\Hy@backout}{Doc-Start}{\@currentHref}{}{\errmessage{I can't seem to patch backref}}
%\makeatother
%%%%% END BACKREF PATCHES            
            
            
            
            
            
            
            
            
            

% Allows me to import pictures 
\usepackage{graphicx}
% Sample code to include a picture (make sure you include the full filepath if the picture is not in the same directory as the .TeX file you are working on)
% \includegraphics[scale=0.5]{coopdontbreak11-27-11.pdf}\\

%these two packages enable text overlays on graphics , great for greating infographics
\usepackage[abs]{overpic}
\usepackage{pict2e}
%example
%\begin{overpic}[scale=.65,unit=1mm]{791P_InfoGraphic_Picture.pdf}
%    \put(210,130){Your stuff here}
%   \put(100,-10){\includegraphics[scale = .2]{791P_Homework_2_CDF_INFO.pdf}}
%   
%\end{overpic}

%allows us to draw trees as follows:
\usepackage{qtree}
%\Tree [.S a [.NP {\bf b} c ] d ]

% this is a truely awesome package for building game trees and all sorts of diagrams, see the website below for sweet examples
%http://www.texample.net/tikz/

\usepackage{tikz}
\usetikzlibrary{trees}

%you can use \hphantom{} to create an invisible box. good for helping allign numbers over multiple subgames using \hspace{}

%example code for making baller game trees
%credit: http://www.drewdimmery.com/extensive-form-game-trees-in-tikz/
%\begin{figure}
%\begin{center}
%% First, set the overall layout of the tree
%% You might need to play with these sizes to ensure nothing overlaps.
%\tikzstyle{level 1}=[level distance=1.5cm, sibling distance=2.5cm]
%\tikzstyle{level 2}=[level distance=1.5cm, sibling distance=2.5cm]
%\tikzstyle{level 3}=[level distance=1.5cm, sibling distance=1cm]
%\tikzstyle{level 4}=[level distance=1.5cm, sibling distance=2cm]
%\begin{tikzpicture}
%%Start with the parent node, and slowly build out the tree
%% with each "child" representing a new level of the diagram
%% each "node" represents a labelled (or unlabeled if you 
%% want) node in the diagram.
%\node {Player 1}
%    child{
%        child{
%                        %Put the name of the node in parenthesis for
%                        % reference later. The label shown in the diagram
%                        % goes in the brackets. This label can use math mode.
%            node(a){2}
%            child{
%                node{(0,0)}
%                                %This allows us to attach a label to the 
%                                % edge between nodes. This label is just 
%                                % another node, so we can also name it and
%                                % attach things to it.
%                edge from parent
%                node[left]{T}
%            }
%            child{
%                node{(2,2)}
%                edge from parent
%                node[right]{B}
%            }
%                  %Invisible branch to make things align properly.
%        } child{edge from parent[draw=none] } 
%    edge from parent
%    node[left]{$D_1$}
%    }
%    child{
%        node{1b}
%        child{
%            node(b){2}
%            child{
%                node{(0,0)}
%                edge from parent
%                node[left]{T}
%            }
%            child{
%                node{(0,0)}
%                edge from parent
%                node[right]{B}
%            }
%        edge from parent
%        node[left]{U}
%        }
%        child{
%            node(c){2}
%            child{
%                node{(1,1)}
%                edge from parent
%                node[left]{T}
%            }
%            child{
%                node{(2,2)}
%                edge from parent
%                node[right]{B}
%            }
%        edge from parent
%        node[right]{D}
%        }
%    edge from parent
%    node[right]{R}
%    };
%%Now I create the information set. Note that I utilize the names
%% that I had previously assigned to nodes in my graph
%\draw [dashed](a)--(b);
%\draw [dashed](b)--(c);
%\end{tikzpicture}
%\end{center}
%\end{figure}


%for making graphical models
\usetikzlibrary{fit,positioning}


%\begin{figure}[h]
%\centering
%\begin{tikzpicture}
%\tikzstyle{main}=[circle, minimum size = 10mm, thick, draw =black!80, node distance = 16mm]
%\tikzstyle{connect}=[-latex, thick]
%\tikzstyle{box}=[rectangle, draw=black!100]
%  \node[main, fill = white!100] (alpha) [label=below:$\alpha$] { };
%  \node[main] (theta) [right=of alpha,label=below:$\theta$] { };
%  \node[main] (z) [right=of theta,label=below:z] {};
%  \node[main] (beta) [above=of z,label=below:$\beta$] { };
%  \node[main, fill = black!10] (w) [right=of z,label=below:w] { };
%  \path (alpha) edge [connect] (theta)
%        (theta) edge [connect] (z)
%        (z) edge [connect] (w)
%        (beta) edge [connect] (w);
%  \node[rectangle, inner sep=0mm, fit= (z) (w),label=below right:N, xshift=13mm] {};
%  \node[rectangle, inner sep=4.4mm,draw=black!100, fit= (z) (w)] {};
%  \node[rectangle, inner sep=4.6mm, fit= (z) (w),label=below right:M, xshift=12.5mm] {};
%  \node[rectangle, inner sep=9mm, draw=black!100, fit = (theta) (z) (w)] {};
%\end{tikzpicture}
%\end{figure}



\usepackage[ruled,vlined]{algorithm2e}

%\begin{algorithm}[H]
% \SetAlgoLined
% \KwData{this text}
% \KwResult{how to write algorithm with \LaTeX2e }
% initialization\;
% \While{not at end of this document}{
%  read current\;
%  \eIf{understand}{
%   go to next section\;
%   current section becomes this one\;
%   }{
%   go back to the beginning of current section\;
%  }
% }
% \caption{How to write algorithms}
%\end{algorithm}


% package from http://www.ruudwetzels.com/latexgm could also be used, It gives me lots of errors though.
%\usepackage{pst-all}
%\usepackage{com.braju.pstricks}
%\usepackage{com.braju.graphicalmodels}








 




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CUSTOM SECTION HEADERS
% this modifies the traditional \section{} and \subsection{} commands to add underlining and color as well as changing the font
% can use the [compact] parameter below to have titles that are more compact:
%\RequirePackage[compact]{titlesec}
%
%\titleformat{\section}         % Customise the \section command can add \color{blue}
%  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
%                               % small capitals (\scshape) and left aligned (\raggedright)
%  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
%  {}                           % Can be used to insert code before the heading
%  [\titlerule]                 % Inserts a horizontal line after the heading
%
%\titleformat{\subsection}
%%can include \color{red} at the end of the below line
%  {\large\scshape\raggedright\color{red}} %can add \color{} to change the color of all titles.
%  {}{0em}
%  {}
%  
%  \titleformat{\subsubsection}
%%can include \color{red} at the end of the below line
%  {\bf\raggedright\color{blue}} %can add \color{} to change the color of all titles.
%  {}{0em}
%  {}
%
%\newcommand{\datedsection}[2]{%
%  \section[#1]{#1 \hfill #2}%
%}
%\newcommand{\datedsubsection}[2]{%
%  \subsection[#1]{#1 \hfill #2}%
%}


\newcommand{\colorsections}{
\RequirePackage[compact]{titlesec}

\titleformat{\chapter}
%can include \color{red} at the end of the below line
  {\HUGE\bf\raggedright\color{darkgreen}}
  %can add \color{} to change the color of all titles.
  {}{0em}
  {}

	\titleformat{\section}
%can include \color{red} at the end of the below line
  {\Huge\bf\raggedright\color{red}}
  %can add \color{} to change the color of all titles.
  {}{0em}
  {}
  
  \titleformat{\subsection}
%can include \color{red} at the end of the below line
  {\LARGE\bf\raggedright\color{blue}} %can add \color{} to change the color of all titles.
  {}{0em}
  {}
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page layout (geometry)
%\setlength\voffset{-1in}
%\setlength\hoffset{-1in}
%\setlength\topmargin{.5in}
%\setlength\oddsidemargin{1in}
%\setlength\textheight{9.75in}
%\setlength\textwidth{6.5in}
%\setlength\footskip{0.0cm}
%\setlength\headheight{0cm}
%\setlength\headsep{0cm}

% Landscape Page Layout Geometry
% Page layout (geometry)
\setlength\voffset{-1in}
\setlength\hoffset{-1in}
\setlength\topmargin{.5in}
\setlength\oddsidemargin{.5in}
\setlength\textheight{9.8in}
\setlength\textwidth{7.5in}
\setlength\footskip{.7cm}
\setlength\headheight{0cm}
\setlength\headsep{0cm}



\newcommand{\oneinchmargins}{
	\setlength\topmargin{1in}
	\setlength\oddsidemargin{1in}
	\setlength\textheight{9in}
	\setlength\textwidth{6.5in}
}

\newcommand{\bluelinks}{
\hypersetup{colorlinks,breaklinks,
            linkcolor=darkblue,urlcolor=brightblue,
            anchorcolor=brightblue,citecolor=brightblue}
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Footnote rule
\setlength{\skip\footins}{0.0469in}
\renewcommand\footnoterule{\vspace*{-0.0071in}\setlength\leftskip{0pt}\setlength\rightskip{0pt plus 1fil}\noindent\textcolor{black}{\rule{0.25\columnwidth}{0.0071in}}\vspace*{0.0398in}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pages styles
\makeatletter
\newcommand\ps@Standard{
  \renewcommand\@oddhead{}
  \renewcommand\@evenhead{}
  \renewcommand\@oddfoot{}
  \renewcommand\@evenfoot{}
%  \renewcommand\thepage{\arabic{page}}
}
\makeatother
%\pagestyle{Standard}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% the shrink equation environment allows us to shrink the space around equations so we can fit more stuff in a smaller vertical space (great for cheat sheets
%\usepackage{extsizes} % extends the range of font sizes available so we can make fonts even smaller

\newenvironment{shrinkeq}[1]
{ \bgroup
  \addtolength\abovedisplayshortskip{#1}
  \addtolength\abovedisplayskip{#1}
  \addtolength\abovedisplayskip{#1}
  \addtolength\belowdisplayshortskip{#1}
  \addtolength\belowdisplayskip{#1}}
{\egroup\ignorespacesafterend}


% the code environment means we can enter code text and have it appear in computer modern font with a grey background so it looks really cool
\lstnewenvironment{code}{%
  \lstset{backgroundcolor=\color{verbgray},
  frame=single,
  framerule=0pt,
  basicstyle=\ttfamily,
  columns=fullflexible}}{}
  
%Changes the color of verbatim output  
%\makeatletter  
%\renewcommand\verbatim@font{\color{RoyalBlue}\ttfamily}
%\makeatletter
%\makeatletter
%\renewcommand\verbatim@font{\color{blue}\fontsize{12}{12}\ttfamily}
%\makeatletter

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Multicolumn package allows us to create multiple collumns on a single page that are automatically formatted to have the correct width by using a command in the body of our document that looks like this:
%\begin{multicols}{3}
 %\tiny (optional to make the text really small for cheat sheets)
\usepackage{multicol}
\setlength{\columnseprule}{1pt}
\setlength{\columnsep}{8pt}

% Define my own commands
% The \qed command puts a black box at the end of the line to specify the completion of a proof
%\newcommand{\qed}{\hfill \ensuremath{\blacksquare}}

%Lagrangian
\DeclareMathOperator{\Lagr}{\mathcal{L}}
%Indicator Function
 \DeclareMathOperator{\Ind}{\mathbbm{1}}
 
 %lets me name my own theorem
% \newtheoremstyle{named}{}{}{\itshape}{}{\bfseries}{.}{.5em}{\thmnote{#3}}
%\theoremstyle{named}
%\newtheorem*{namedtheorem}{Theorem}
%% \begin{namedtheorem}[The First Theorem of Welfare Economics:]
%\end{namedtheorem}

 
 \newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{result}{Result}
\newtheorem{conclusion}{Conclusion}
\newtheorem{result1a}{Result 1.A}
\newtheorem{assumption}{Assumption}
\newtheorem{conjecture}{Conjecture}
\newtheorem{definition}{Definition}
\newtheorem{hypothesis}{Hypothesis}
\newtheorem{resquest}{Research Question}
\newtheorem{Proof}{Proof}
\newtheorem{note}{Note}

\newcommand{\myitem}{\item[\textperiodcentered]}

%adding an under or overbrace with text (to tell that a term in an equation is negative or positive can be done with the following code:

% \underbrace{(x+2)^3}_\text{text 1} + \overbrace{(x-3)}^\text{text 2}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%List Package
%\newlist{lonelist}{itemize}{3}
%    \setlist[lonelist]{label=\enskip\textbullet,leftmargin=*,partopsep=0pt,topsep=0pt}
%    \fixendlist{lonelist}
%    \fixouterlist{lonelist}


%----------------------------------------------------------------------------------------
%	TITLE Package that takes parameters of of title and then name as in the following example:
%\begin{document}
%\titleAT[Master's Thesis Draft]{Matthew Denny}
%----------------------------------------------------------------------------------------

%\def\titleAT@aux#1#2
\newcommand*{\titleAT[2]}{\begingroup % Create the command for including the title page in the document
\newlength{\drop} % Command for generating a specific amount of whitespace
\drop=0.1\textheight % Define the command as 10% of the total text height
%

\noindent\rule{\textwidth}{0.4pt}\par % Thin horizontal line
\vspace{2pt}\vspace{-\baselineskip} % Whitespace between lines
\noindent\rule{\textwidth}{1pt}\par % Thick horizontal line
\vspace{1.5 mm}
\centering % Center all text
\textcolor{black}{ % Black font color
{\Huge {#1}}\\[0.5\baselineskip] % Title line 1
}
{\Large \textsc{#2   \hspace{20pt} \today}}\par % Author name
\vspace{-1.5 mm}
\rule{\textwidth}{0.4pt}\par % Thin horizontal line
\vspace{2pt}\vspace{-\baselineskip} % Whitespace between lines
\rule{\textwidth}{1pt}\par % Thick horizontal line
\bigskip

\endgroup}


%\def\titleNL@aux#1#2
\newcommand*{\titleNL[2]}{\begingroup % Create the command for including the title page in the document
\newlength{\drop} % Command for generating a specific amount of whitespace
\drop=0.1\textheight % Define the command as 10% of the total text height
%/textsc for small caps in the title

\vspace{1.5 mm}
\centering % Center all text
\textcolor{black}{ % Black font color
{\Huge  {#1}}\\[0.5\baselineskip] % Title line 1
}
{\Large #2   \hspace{20pt} \today}\par % Author name
\vspace{-1.5 mm}
\bigskip

\endgroup}


%\def\titleAT@aux#1#2
\newcommand*{\titleLOGO[2]}{\begingroup % Create the command for including the title page in the document
\newlength{\drop} % Command for generating a specific amount of whitespace
\drop=0.1\textheight % Define the command as 10% of the total text height
%

\noindent\rule{\textwidth}{0.4pt}\par % Thin horizontal line
\vspace{2pt}\vspace{-\baselineskip} % Whitespace between lines
\noindent\rule{\textwidth}{1pt}\par % Thick horizontal line
\vspace{1.5 mm}
\centering % Center all text
%\textcolor{black} % Black font color
\begin{tabular}{cc}
\begin{minipage}{5in}
\centering
{\Huge {#1}} \\[0.5\baselineskip] 
{\large \textsc{#2   \hspace{20pt} \today}}
\end{minipage}
&
\begin{minipage}{2in}
\centering
 \includegraphics[scale=.7]{ISSR_logo.png}
\end{minipage}

 

\end{tabular}
\par
%\vspace{-1.5 mm}
\rule{\textwidth}{0.4pt}\par % Thin horizontal line
\vspace{2pt}\vspace{-\baselineskip} % Whitespace between lines
\rule{\textwidth}{1pt}\par % Thick horizontal line
\bigskip

\endgroup}





%%%%%%%%%%%%%%%%%%
% move the page number down
\setlength{\footskip}{30pt}



%custom comments
\newcommand{\com[1]}{ \textcolor{blue}{ \# {#1} }}






