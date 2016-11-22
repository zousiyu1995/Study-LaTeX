% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Zousiyu}
%中英文之间空格，chapter任意页码开始，book文档类型，可加oneside参数去掉编译出来的空白页，fntef调用下画线宏包
\LoadClass[
	a4paper,
	openany,%每一章从左页或右页均可开始
	oneside,%单页排版，每页左边空、页眉页脚相同
	]{book}

\usepackage[
	UTF8,
	zihao=5,%默认字号为5号
	fntef,
	heading=true,%启用修改章节标题的接口
	linespread=1.3,%行距
	autoindent=true,%在字体大小发生变化后，自动调整首行缩进的大小
	]{ctex}
	
\ctexset{
	punct=quanjiao,%标点处理方式
	today=big,%全汉字日期格式
}

\usepackage[svgnames,table]{xcolor}
\usepackage{pdfpages}%插入PDF文件
%========================宏包和相关设置===============================
\usepackage{endnotes}%尾注宏包
\usepackage{fontspec}%字体选择宏包
\usepackage{etoolbox}%编程宏包，用于更改chapter定义
\usepackage{marginnote}%边注
\usepackage{lettrine}%首字下沉宏包

%========================表格宏包================================
\usepackage{array}%表格宏包
\usepackage{diagbox}%对角线宏包，刘海洋
\usepackage{colortbl}%彩色表格宏包
\usepackage{booktabs}%表格线宏包
\usepackage{multirow}%跨行
\usepackage{multicol}%跨列

\usepackage[top=2.7truecm,bottom=2.2truecm,left=3truecm,right=3truecm,includefoot,xetex]{geometry}
\usepackage[version=4]{mhchem}%化学式宏包
\usepackage{chemfig}%化学式宏包
\usepackage{siunitx}%单位宏包
\usepackage{mathtools}%数学宏包
\usepackage{amsmath,amssymb,amsfonts}%数学宏包
\usepackage{latexsym,textcomp,mathrsfs,euscript,yhmath}%与默认字体不冲突的一些符号包
\usepackage{texnames,metalogo}%TeX家族标识符宏包

%定义一些amsmath没有定义的函数
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccot}{arccot}
\DeclareMathOperator{\arccsc}{arccsc}

\usepackage{titletoc}%目录样式宏包
\usepackage{titlesec}%标题样式宏包
\usepackage{caption}%图表标题宏包

\usepackage{listings}%代码展示宏包
\usepackage{pgfplots}%数学绘图宏包
\usepackage{paralist}%多功能列表宏包
\usepackage{tikz}%绘图
\usepackage[perpage]{footmisc}%脚注宏包
\usepackage{pifont}%产生带圈数字

%参考文献
\usepackage[
	backend=biber,%处理方式
	style=gb7714-2015%样式
	]{biblatex}
\addbibresource{Zousiyu.bib}

% 令 \cleardoublepage 的偶数页页眉页脚为空
%\renewcommand{\cleardoublepage}
%{\clearpage\if@twoside \ifodd\c@page\else
%	\hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%===========================字体设置=================================
\setmainfont{Times New Roman}%西文主字体
\setCJKmainfont{SimSun}%中文主字体

\setmonofont{Source Code Pro}%英文等宽DejaVu Sans Mono,Inconsolata
\setCJKmonofont{simfang.ttf}%中文等宽，仿宋

\newfontfamily{\enheiti}{黑体}%适用于英文的黑体

%重新定义解说列表asparadesc的标签
\renewcommand{\paradescriptionlabel}[1]{\bfseries\heiti\color{blue!40!black} #1}

%======================新定义，使引用变为图1-1，式（3-2）这样的形式==========================
%\usepackage{xr}%文件间的交叉引用

\AtBeginDocument{%
	\def\figureautorefname{图}%
	\def\tableautorefname{表}%
	\def\partautorefname{卷}%
	\def\appendixautorefname{附录}%
	\def\equationautorefname{式}%
	\def\Itemautorefname{列表}%
	\def\chapterautorefname{章}%
	\def\sectionautorefname{节}%
	\def\subsectionautorefname{小节}%
	\def\subsubsectionautorefname{条目}%
	\def\paragraphautorefname{自然段}%
	\def\Hfootnoteautorefname{脚注}%
	\def\AMSautorefname{式}%
	\def\theoremautorefname{定理}%
	\def\pageautorefname{页}%
%	\renewcommand{\pageref}[1]{第#1页}%
}

%===========================图片设置=================================
\graphicspath{{fig/}}%图片路径
%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg,.bmp}

%===========================页眉页脚=================================
\usepackage{fancyhdr}%页眉页脚宏包
%\pagestyle{fancy}
%%上面两行必备
%\fancyhf{}%清空当前设置
%%\fancyhead[R]{邹思宇的 \LaTeX 学习笔记}
%%\fancyfoot[C]{\thepage}
%\lhead{\heiti\leftmark}
%\rhead{\heiti\rightmark}
%\chead{\heiti 邹思宇的 \LaTeX 学习笔记}
%\cfoot{--\ \thepage\ --}
%\headrulewidth{0.5pt} %页眉线
%\footrulewidth{0pt} %页脚线

%重新定义页眉页脚上的章节样式
%\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
%\renewcommand{\chaptermark}[1]{\markboth{第\thechapter 章\ #1}{}}

% 边注和索引，来自重庆大学模版
\colorlet{Note}{purple}%用于各自标注的颜色
\renewcommand*{\marginfont}{\color{Note}\sffamily\heiti}
\DeclareDocumentCommand{\bz}{s o m}{%
	\IfBooleanTF {#1}
	{%ture
		\IfNoValueTF{#2}{\marginnote[#3]{#3}}{\marginnote[#2]{#3}}
	}{%false
	\IfNoValueTF{#2}{\marginnote[#3]{#3}}{\marginnote[#2]{#3}}
	\index{#3}
	}%
}
% 解决索引ind文件依赖问题
\let\scan@allowedfalse\relax
\let\pfill\dotfill

% 带圈数字，不能超过10个
\def\@circlenum#1{
	\ding{\the\numexpr\value{#1}+171\relax}%
}
% 脚注使用带圈数字，注意命令的执行时机
\AtBeginDocument{%
	\renewcommand{\thefootnote}{\@circlenum{footnote}}
	\renewcommand{\thempfootnote}{\@circlenum{mpfootnote}}
}

%=========================标题样式设置===============================
\setcounter{secnumdepth}{3}%设置标题深度
\colorlet{ZousiyuTitle}{blue!40!black}%标题颜色

\ctexset{
	chapter={
		number=\chinese{chapter},
		format=\centering\heiti\zihao{2}\color{ZousiyuTitle},
		beforeskip = 36bp \@plus 1ex \@minus .2ex,
		afterskip = 16bp \@plus .2ex,
	},
	section={
		format=\heiti\zihao{-3}\raggedright\color{ZousiyuTitle},
		nameformat+=\enheiti,
		titleformat+=\heiti,
%		numberformat+=\enheiti,
		aftername=\quad,
		beforeskip=0pt,
		afterskip=0pt,
	},
	subsection={
		format=\heiti\zihao{-4}\raggedright\color{ZousiyuTitle},
		nameformat+=\enheiti,
		titleformat+=\heiti,
		aftername=\quad,
		beforeskip=0pt,
		afterskip=0pt,
	},
	subsubsection={
		format=\heiti\zihao{-4}\raggedright\color{ZousiyuTitle},
		nameformat+=\enheiti,
		titleformat+=\heiti,
		aftername=\quad,
		beforeskip=0pt,
		afterskip=0pt,
	}
}

%=================================目录===============================
\setcounter{tocdepth}{2}%目录深度

%\renewcommand\contentsname{\heiti\zihao{3}
%	\hspace*{\fill}
%	目\quad 录
%	\hspace*{\fill}}
%\hspace*{\fill}用于生成空白

\titlecontents{chapter}[0pt]{\bfseries\heiti}{\thecontentslabel}{}{\titlerule*{}\contentspage}
%\titlecontents{section}[1em]{\songti \zihao{-4}}{\thecontentslabel}{}{\titlerule*{$\cdots$}\contentspage}
%\titlecontents{subsection}[3em]{\songti \zihao{-4}}{\thecontentslabel}{}{\titlerule*{$\cdots$}\contentspage}
%\titlecontents{subsubsection}[3em]{\songti \zihao{-4}}{\thecontentslabel}{}{\titlerule*{$\cdots$}\contentspage}
%\titlecontents{paragraph}[4em]{\songti \zihao{-4}}{\thecontentslabel}{}{\titlerule*{$\cdots$}\contentspage}

%===========================图表标题样式============================
\DeclareCaptionFont{heiti}{\heiti}
\captionsetup[figure]{labelsep=space,justification=centering,font=heiti,aboveskip=1mm,belowskip=1mm}%空格分隔符，居中，黑体
\captionsetup[table]{labelsep=space,justification=centering,font=heiti,aboveskip=1mm,belowskip=1mm}%空格分隔符，居中，黑体

%自定义各列列宽，使用参数CRL+长度
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}m{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\raggedleft}m{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}m{#1}}

\usepackage{color}					%[usenames,dvipsnames]

%============================代码环境===============================
%定义一个代码字体
%\newfontfamily\daima{Consolas}

%\definecolor{backcolor}{RGB}{242,242,242}			%背景色
%\definecolor{comment}{black!60}					%注释
%\definecolor{keyword}{RGB}{0,0,255}					%关键词
%\definecolor{string}{RGB}{206,145,108}				%字符串
%\definecolor{package}{RGB}{0,128,0}
%\definecolor{envi}{RGB}{185,70,15}					%环境
%	backgroundcolor=\color{backcolor},			%背景色
%	commentstyle=\color{comment},
%	keywordstyle=\color{keyword},
%	stringstyle=\color{string},


%提供一个代码环境的基本样式
\lstdefinestyle{CodeBase}
{
	basicstyle=\small\ttfamily,%\ttfamily等宽字体
	frame=l,
	aboveskip=5pt,%上边距
	belowskip=5pt,%下边距
	lineskip=0pt,
	tabsize=4,%设置tab空格数
	showtabs=false,%Tab
	showspaces=false,%空格标识
	showstringspaces=false,
	numbers=left,
	numbersep=5pt,%行号与代码距离
	numberstyle=\small\ttfamily,
	rulecolor=\color{cyan},
	boxpos=c,
	xleftmargin=1em,%左边距
	xrightmargin=0pt,
	breaklines=true,%自动换行
	breakindent=0pt,%换行后缩进为0
	extendedchars=false,%解决代码跨页时，章节标题，页眉等汉字不显示的问题
	framesep=3pt,
	rulesep=2pt,
	framerule=1pt,
	%代码颜色设置
	backgroundcolor=\color{gray!5},
	stringstyle=\color{green!40!black!100},
	keywordstyle=\bfseries\color[RGB]{0,0,255},%\color{blue!50!black}
	commentstyle=\fangsong\slshape\color{black!60},
	}

%LaTeX代码环境用
\lstdefinestyle{LaTeX}
{
	style=CodeBase,
	language=[LaTeX]TeX,
	texcsstyle=*\color[RGB]{0,0,255}\bfseries,%反斜杠高亮
	morekeywords={addplot, begin, end, color, text},
	}
%定义latex代码专用环境
\lstnewenvironment{latex}[1]{\lstset{style=LaTeX}}{}

%matlab代码展示
\lstdefinestyle{Matlab}{
	style=CodeBase,
	language=Matlab
	}
\lstnewenvironment{Matlab}[1]{\lstset{style=Matlab}}{}

%python代码展示
\lstdefinestyle{python}{
	style=CodeBase,
	keywordstyle=\slshape\color[RGB]{0,0,255},
	language=Python,
	morekeywords={def},
	}
\lstnewenvironment{python}[1]{\lstset{style=python}}{}

%\newcommand{\latexline}[1]{{\lstinline[language=TeX,basicstyle=\small\ttfamily]{#1}}}

\newcommand{\qd}[1]{{\slshape{#1}}}% 强调，斜体

%说明环境
\newcommand{\note}[1]{{%
	\color{magenta}{\heiti 说明：}\emph{#1}}}

%命令环境，\cmd{}直接输出命令加反斜杠，避免麻烦
\DeclareRobustCommand*\cmd[1]{\texttt{\char`\\#1}}
\def\crcmd{\cmd{\char`\\}}

%===============构建一个左边显示代码，右边显示编译结果的代码展示环境====================
\usepackage{verbatim}
% 示例环境 example
% 环境中的代码被 verbatim 环境处理到一个临时文件中
% 再从临时文件中读取，分别生成代码盒子和示例盒子
\newwrite\example@out
\newlength\savefboxrule
\newlength\savefboxsep
\edef\example@name{\jobname-example.aux}
\newenvironment{codeshow}%
{\begingroup\@bsphack
	\immediate\openout\example@out=\example@name
	\let\do\@makeother\dospecials\catcode`\^^M\active
	\def\verbatim@processline{\immediate\write\example@out{\the\verbatim@line}}%
	\verbatim@start}%
{\immediate\closeout\example@out\@esphack\endgroup%
	\trivlist\item\relax
	\setlength{\savefboxrule}{\fboxrule}%
	\setlength{\savefboxsep}{\fboxsep}%
	\setlength{\fboxsep}{0.015\textwidth}%
	\setlength{\fboxrule}{0.4pt}%
	\fcolorbox[gray]{0}{0.95}{%
		\begin{minipage}[c]{0.45\textwidth}%
			\setlength{\fboxrule}{\savefboxrule}%
			\setlength{\fboxsep}{\savefboxsep}%
			\small\verbatiminput{\example@name}%
		\end{minipage}%
	}%
	\hfill%
	\fbox{%
		\begin{minipage}[c]{0.45\textwidth}%
			\setlength{\fboxrule}{\savefboxrule}%
			\setlength{\fboxsep}{\savefboxsep}%
			\setlength{\parskip}{1ex plus 0.4ex minus 0.2ex}%
			\normalsize\input{\example@name}%
		\end{minipage}%
	}%
	\endtrivlist
}

%新codeshow环境
%\usepackage{fancyvrb}

%====================最后放置链接宏包，避免冲突===============================
\usepackage{hyperref}
\hypersetup{
	bookmarksopen=false,%显示书签
	bookmarksnumbered=true,%显示书签编号
	unicode=true,%使书签支持unicode字符
	breaklinks=true,%链接自动换行
	colorlinks=true,%加颜色区分链接
	citecolor=black,%文献序号颜色
}
%定制pdf属性
\hypersetup{
	pdftitle={邹思宇的\LaTeXe 学习笔记},
	pdfauthor={邹思宇},
	pdfkeywords={LaTeX,PGFplot,Tikz,邹思宇},
	pdfstartview=Fit,%整个页面适合窗口
%	pdfsubject={},
%	pdfproducer={},
%	pdfcreator={}
}