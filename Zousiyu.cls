% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Zousiyu}
\LoadClass[oneside]{book}
\usepackage[heading=true]{ctex}
\usepackage{fontspec}
\usepackage[svgnames,table]{xcolor}%颜色宏包
\setcounter{secnumdepth}{2}%设置标题计数器深度
\colorlet{title}{blue!40!black}
\ctexset{%
    chapter={%
        format+=\zihao{2}\color{title},
        beforeskip=2pt plus 1pt minus 1pt,
        afterskip=10pt plus 2pt minus 2pt,
        fixskip=true,
    },
    section={%
        format=\heiti\zihao{-3}\color{title},
        aftername=\quad,
        beforeskip=5pt plus 1pt minus 1pt,
        afterskip=5pt plus 1pt minus 1pt,
    },
    subsection={%
        format=\heiti\zihao{-4}\color{title},
        aftername=\quad,
        beforeskip=5pt plus 1pt minus 1pt,
        afterskip=5pt plus 1pt minus 1pt,
    },
    subsubsection={%
        format=\heiti\zihao{-4}\color{title},
        beforeskip=5pt plus 1pt minus 1pt,
        afterskip=5pt plus 1pt minus 1pt,
    }
}%
\usepackage{geometry}
    \geometry{paper=a4paper,
        hmargin=3cm,
        vmargin=2cm,
        marginparwidth=2.5cm,
}%
\usepackage{pdfpages}%插入PDF文件
\usepackage{etoolbox}
\usepackage{marginnote}%边注
    \renewcommand{\marginfont}{\sffamily\color{purple}\zihao{5}}
    \newcommand{\bz}[1]{\marginnote{#1}\index{#1}}
\usepackage[perpage]{footmisc}%脚注
\usepackage{enumitem}%列表
    \setlist[description]{%
        font=\bfseries\color{blue!40!black},
        noitemsep,
        nosep,
        align=left,
        leftmargin=!,
        labelindent=\parindent,
        labelwidth=20mm,
        labelsep=1em,
        itemindent=0mm,
    }
    \setlist[enumerate]{%
        noitemsep,
        nosep,
        leftmargin=0pt,
        itemindent=*,
        labelindent=\parindent,
        listparindent=\parindent,
    }
    \setlist[itemize]{%
        nosep,
        leftmargin=\parindent,
    }
%\usepackage{doc}
%========================表格宏包================================
\usepackage{array}%表格宏包
\usepackage{diagbox}%对角线宏包，刘海洋
\usepackage{colortbl}%彩色表格宏包
\usepackage{longtable}%长表格，跨页
\usepackage{tabu}
\usepackage{hhline} % 双线表
\usepackage{booktabs}%三线表
\usepackage{multirow}%跨行
\usepackage{multicol}%跨列
\usepackage{dirtree}%目录树
    \renewcommand*\DTstyle{\rmfamily}
    \renewcommand*\DTstylecomment{\heiti\color{blue!40!black}}
%数学，化学，单位，符号
\usepackage{amsmath,amssymb,amsfonts}%数学宏包
    \DeclareMathOperator{\arcsec}{arcsec}
    \DeclareMathOperator{\arccot}{arccot}
    \DeclareMathOperator{\arccsc}{arccsc}
    \numberwithin{equation}{section}%在公式序号中增加节序号
\usepackage[version=4]{mhchem}%化学式宏包
\usepackage{chemfig}%化学式宏包
\usepackage{unicode-math}
\usepackage{siunitx}%单位宏包
\usepackage{mathtools}%数学宏包
\usepackage{xfrac}%斜线分式
\usepackage{metalogo}%TeX家族标识符宏包
\usepackage{hologo}
\usepackage{listings}%代码展示宏包
\usepackage{pgfplots}%数学绘图宏包
\usepackage{tikz}%绘图
\graphicspath{{fig/}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg,.bmp}
%参考文献
\usepackage[backend=biber,style=gb7714-2015,]{biblatex}
    \addbibresource{Zousiyu.bib}
%===========================字体设置=================================
\setmainfont{TeX Gyre Pagella}%西文主字体,Times New Roman
\setmathfont[math-style=ISO,bold-style=ISO,vargreek-shape=TeX]{TeX Gyre Pagella Math}
\setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}%中文主字体
\setmonofont{DejaVu Sans Mono}%英文等宽Source Code Pro
\setCJKmonofont{FangSong}%中文等宽，仿宋
\usepackage{biolinum}%西文无衬线
%\setsansfont{微软雅黑}%无衬线字体
\setCJKsansfont{SimHei}

\newfontfamily{\enheiti}{黑体}%适用于英文的黑体

%新命令
\newcommand{\pkg}[1]{\textsf{\itshape #1}}
\newcommand{\note}[2][注意]{\noindent\textbf{#1：}\textit{#2}}

%表格颜色
\definecolor{oddrows}{RGB}{243,246,246}%奇数行
\definecolor{evenrows}{RGB}{228,228,228}%偶数行
\definecolor{header}{RGB}{0,104,183}%表头

%===========================页眉页脚=================================
\usepackage{fancyhdr}%页眉页脚宏包
\pagestyle{fancy}
    \fancyhead{}
        \fancyhead[LO,RE]{\bfseries\itshape\thepage/\pageref{LastPage}}
        \fancyhead[EC]{\slshape\leftmark}
        \fancyhead[OC]{\slshape\rightmark}
    \fancyfoot{}
% 章标题所在页专用版式
\fancypagestyle{chapterpage}{%
    \chead{\color{title}\slshape\leftmark}
    \lhead{\color{title}\bfseries\itshape\thepage/\pageref{LastPage}}
    \rhead{\color{title}\sffamily\LaTeXe{}学习笔记}
}

%% 带圈数字，不能超过10个
%\usepackage{pifont}%产生带圈数字
%\def\@circlenum#1{%
%    \ding{\the\numexpr\value{#1}+171\relax}%
%}
%% 脚注使用带圈数字，注意命令的执行时机
%\AtBeginDocument{%
%    \renewcommand{\thefootnote}{\@circlenum{footnote}}
%    \renewcommand{\thempfootnote}{\@circlenum{mpfootnote}}
%}

%脚注，带圈数字，刘海洋，可以超过10
\usepackage{xunicode-addon}
\newfontfamily\fnmarkfont{ipag.ttf} % 带圈 0 到 20 被认做西文符号
\newCJKfontfamily\fnCJKmarkfont{ipag.ttf} % 带圈数字超过 20 是 CJK 符号
\renewcommand\thefootnote{{\fnmarkfont\fnCJKmarkfont\textcircled{\arabic{footnote}}}}
%=================================目录===============================
\usepackage{titletoc}%目录样式宏包
\setcounter{tocdepth}{2}%目录深度
    \titlecontents{chapter}%
        [0pt]%左边距
        {\bfseries\heiti}%格式调整
        {\thecontentslabel}%有标签
        {\thecontentslabel}%无标签
        {\titlerule*[8pt]{$\cdot$}\contentspage}%填充
        %[]%目录之后的格式
%===========================图表标题样式============================
\usepackage[hypcap=true,hypcapspace=2cm]{caption}%修复交叉引用跳转位置不准
    \captionsetup[figure]{%
        labelsep=quad,
        justification=centering,
        labelfont=it,
        textfont={bf,color=title},
    }%
    \captionsetup[table]{%
        labelsep=quad,
        justification=centering,
        labelfont=it,
        textfont={bf,color=title},
    }%
%图标浮动体的一些间距
\setlength{\textfloatsep}{0.5\baselineskip}%tp模式与上下文之间的距离
\setlength{\intextsep}{0.5\baselineskip}%h模式与上下文之间的距离
\setlength{\floatsep}{0.5\baselineskip}%两个相邻浮动体之间的距离
\setlength{\abovecaptionskip}{0.5\baselineskip}%标题与浮动体之间的距离
\setlength{\belowcaptionskip}{0.5\baselineskip}

%============================代码环境===============================
\lstset{%
    breaklines,
    basicstyle=\sffamily,
}
%提供一个代码环境的基本样式
\lstdefinestyle{basicstyle}{%
    basicstyle=\small\ttfamily,
    frame=l,
    breaklines=true,
    breakindent=0pt,
    backgroundcolor=\color{gray!5},
    stringstyle=\color{green!40!black!100},
    keywordstyle=\bfseries\color{blue!50!black},
    commentstyle=\ttfamily\slshape\color{black!60},
    rulecolor=\color{blue!50!black},
    framerule=1pt,
    xleftmargin=5pt,
}
%LaTeX代码环境用
\definecolor{math}{RGB}{0,128,0}
\lstdefinestyle{LaTeX}
{%
    style=basicstyle,
    language=[LaTeX]TeX,
    morecomment=[s][\color{math}]{$}{$},
    texcsstyle=*\bfseries\color{blue!50!black},
    moretexcs={node,tcbuselibrary,maketitle,lstset,lstnewenvironment,lstdefinestyle,setlength,definecolor,color},
}
\lstnewenvironment{latex}{\lstset{style=LaTeX}}{}
%Matlab代码展示
\lstdefinestyle{Matlab}{%
    style=basicstyle,
    language=Matlab,
    }
\lstnewenvironment{matlab}{\lstset{style=Matlab}}{}
%Python代码展示
\lstdefinestyle{Python}{%
    style=basicstyle,
    language=Python,
    keywordstyle=\slshape\color[RGB]{0,0,255},
    morekeywords={def},
    }
\lstnewenvironment{python}{\lstset{style=Python}}{}
%===============构建一个左边显示代码，右边显示编译结果的代码展示环境====================
\lstdefinestyle{codeshow}{%
    basicstyle=\ttfamily\footnotesize,%\ttfamily等宽字体
    aboveskip=0pt,%上边距
    belowskip=0pt,%下边距
    lineskip=0pt,
    tabsize=4,%设置tab空格数
    showtabs=false,%Tab
    showspaces=false,%空格标识
    showstringspaces=false,
    boxpos=c,
    xleftmargin=0pt,%左边距
    xrightmargin=0pt,
    breaklines=true,%自动换行
    breakindent=0pt,%换行后缩进为0
}
%===============一些盒子===========================
\usepackage{tcolorbox}%盒子宏包
    \tcbuselibrary{listings,skins,breakable,xparse}
    \newtcblisting{codeshow}{%
        breakable,
        boxrule=0.5pt,%去除文本框线
        arc=0mm,%内弧
        outer arc=0mm,%外弧
        left=0pt,
        right=0pt,
        top=0pt,
        bottom=0pt,
        listing outside text,
        listing options={
            style=codeshow,
        }
    }
%上下codeshow
    \newtcblisting{codeshowabove}{%
        breakable,
        boxrule=0.5pt,%去除文本框线
        arc=0mm,%内弧
        outer arc=0mm,%外弧
        left=0pt,
        right=0pt,
        top=0pt,
        bottom=0pt,
        listing and text,
        listing options={
            style=codeshow,
        }
    }
%摘录功能的代码盒子
    \definecolor{code}{RGB}{240,240,240}
    \DeclareTotalTCBox{\code}{v}{verbatim,
        tcbox raise base,
        breakable,
        on line,
        colback=code,
        arc=0pt,
        fontupper=\sffamily,
        %盒子周围间距
        boxsep=2pt,
        top=0pt,
        bottom=0pt,
        left=-1pt,
        right=-1pt,
        boxrule=0pt,%边框线
    }{#1}
%===========================================
%利用tikz画一组带圈数字
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep=1pt]
        (char) {\phantom{\ifblank{#1}{#2}{#1}}};%
        \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}
%在列表内，产生一组自动编号的带圈数字，需要同时指定列表标签为\dcircled{\arabic*}
\newcommand{\dcircled}[1]{\circled[00]{#1}}
% 索引
\usepackage{imakeidx}
\makeindex
\newcommand{\cmdindex}[1]{\index{\char`\\ #1}}
%====================最后放置链接宏包，避免冲突===============================
\usepackage{nameref}
% 同时引用标签和标题
\newcommand*{\fullref}[1]{\hyperref[{#1}]{\autoref*{#1} \nameref*{#1}}}
\usepackage{lastpage}% 页引用，提供最后一页的页码

\usepackage{hyperref}
    \urlstyle{rm}
    \hypersetup{%
        bookmarksopen=true,%展开书签
        bookmarksnumbered=true,%显示书签编号
        bookmarksopenlevel=1,
        unicode=true,%使书签支持unicode字符
        %链接、颜色
        pagebackref=true,
        breaklinks=true,%链接自动换行
        colorlinks=true,%加颜色区分链接
        citecolor=black,%文献序号颜色
    %    linkcolor=red,
    }
    %定制pdf属性
    \hypersetup{%
        pdftitle={邹思宇的\LaTeXe 学习笔记},
        pdfauthor={邹思宇},
        pdfkeywords={LaTeX,PGFplot,Tikz,邹思宇},
        pdfstartview=Fit,%整个页面适合窗口
    %    pdfsubject={},
    %    pdfproducer={},
    %    pdfcreator={}
    }
%自动引用
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
    %    \def\pageautorefname{页}%
}%
\newcommand*{\refpage}[1]{第~\pageref{#1}~页}