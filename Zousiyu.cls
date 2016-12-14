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
    heading=true,%启用修改章节标题的接口
    linespread=1.3,%行距
    autoindent=true,%在字体大小发生变化后，自动调整首行缩进的大小
    ]{ctex}
    
\ctexset{%
    punct=quanjiao,%标点处理方式
    today=big,%全汉字日期格式
}

%下面两个包是为了提升排版的正式程度和美观程度
%\usepackage[american]{babel}%单词换行的时候，确保单词的切割是按照音节来而不是随意切割
%\usepackage{microtype}%调整全篇文章（或局部）的字间距，使得某段落不会出现单独一个单词占一行，或文章末尾单独一行文字占一页的不美观情况

\usepackage[svgnames,table]{xcolor}
\usepackage{pdfpages}%插入PDF文件
%========================宏包和相关设置===============================
\usepackage{endnotes}%尾注宏包
\usepackage{fontspec}%字体选择宏包
\usepackage{etoolbox}%编程宏包，用于更改chapter定义
\usepackage{marginnote}%边注

%========================表格宏包================================
\usepackage{array}%表格宏包
\usepackage{diagbox}%对角线宏包，刘海洋
\usepackage{colortbl}%彩色表格宏包
\usepackage{booktabs}%三线表
\usepackage{multirow}%跨行
\usepackage{multicol}%跨列

\usepackage{dirtree}%目录树
\renewcommand*\DTstyle{\rmfamily}
\renewcommand*\DTstylecomment{\heiti\color{blue!40!black}}

\usepackage[
    top=2.7truecm,
    bottom=2.2truecm,
    left=3truecm,
    right=3truecm,
    includefoot,
    xetex,
]{geometry}

%数学，化学，单位
\usepackage[version=4]{mhchem}%化学式宏包
\usepackage{chemfig}%化学式宏包
\usepackage{siunitx}%单位宏包
\usepackage{mathtools}%数学宏包
\usepackage{amsmath,amssymb,amsfonts}%数学宏包
\usepackage{autobreak}%长公式自动换行
\usepackage{latexsym,textcomp,mathrsfs,euscript,yhmath}%与默认字体不冲突的一些符号包
%定义一些amsmath没有定义的函数
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccot}{arccot}
\DeclareMathOperator{\arccsc}{arccsc}
\numberwithin{equation}{section}%在公式序号中增加节序号

\usepackage{metalogo}%TeX家族标识符宏包
\usepackage{hologo}%更好的TeX家族标识符宏包，不过命令敲起来不方便，与上面的包共存吧

\usepackage{titletoc}%目录样式宏包
\usepackage{titlesec}%标题样式宏包
\usepackage{caption}%图表标题宏包

\usepackage{listings}%代码展示宏包
\usepackage{pgfplots}%数学绘图宏包
\usepackage{paralist}%多功能列表宏包
\usepackage{enumitem}%对列表环境进行全面设置，可定制性很强
\usepackage{tikz}%绘图
\usepackage[perpage]{footmisc}%脚注宏包
\usepackage{pifont}%产生带圈数字

%参考文献
\usepackage[
    backend=biber,%处理方式
    style=gb7714-2015%样式
    ]{biblatex}
\addbibresource{Zousiyu.bib}

\usepackage{tcolorbox}%盒子宏包
\usepackage{fancyhdr}%页眉页脚宏包
%======================设置区域======================%

%===========================字体设置=================================
\setmainfont{TeX Gyre Pagella}%西文主字体,Times New Roman
\setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}%中文主字体

\setmonofont{DejaVu Sans Mono}%英文等宽DejaVu Sans Mono,Inconsolata,Source Code Pro,TeX Gyre Cursor
\setCJKmonofont{FangSong}%中文等宽，仿宋

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
}%

%===========================图片设置=================================
\graphicspath{{fig/}}%图片路径
%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg,.bmp}

%===========================页眉页脚=================================
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
\def\@circlenum#1{%
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

\ctexset{%
    chapter={%
        number=\chinese{chapter},
        format=\centering\heiti\zihao{2}\color{ZousiyuTitle},
        beforeskip = 36bp \@plus 1ex \@minus .2ex,
        afterskip = 16bp \@plus .2ex,
    },
    section={%
        format=\heiti\zihao{-3}\raggedright\color{ZousiyuTitle},
        titleformat+=\heiti,
        aftername=.~,
        beforeskip=0pt,
        afterskip=0pt,
    },
    subsection={%
        format=\heiti\zihao{-4}\raggedright\color{ZousiyuTitle},
        titleformat+=\heiti,
        aftername=.~,
        beforeskip=0pt,
        afterskip=0pt,
    },
    subsubsection={%
        format=\heiti\zihao{-4}\raggedright\color{ZousiyuTitle},
        titleformat+=\heiti,
        aftername=.~,
        beforeskip=0pt,
        afterskip=0pt,
    }
}

%=================================目录===============================
\setcounter{tocdepth}{2}%目录深度
\renewcommand{\contentsname}{目录}

%7个格式调整
\titlecontents{chapter}%
    [0pt]%左边距
    {\bfseries\heiti}%格式调整
    {\thecontentslabel}%有标签
    {\thecontentslabel}%无标签
    {\titlerule*[8pt]{$\cdot$}\contentspage}%填充
    %[]%目录之后的格式

%===========================图表标题样式============================
\DeclareCaptionFont{heiti}{\heiti}
\captionsetup[figure]{%
    labelsep=space,
    justification=centering,
    font=heiti,
    aboveskip=1mm,
    belowskip=1mm
}%空格分隔符，居中，黑体
\captionsetup[table]{%
    labelsep=space,
    justification=centering,
    font=heiti,
    aboveskip=1mm,
    belowskip=1mm
}%空格分隔符，居中，黑体

%自定义各列列宽，使用参数CRL+长度
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}m{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\raggedleft}m{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}m{#1}}

\usepackage{color}%[usenames,dvipsnames]

%============================代码环境===============================
%定义一个代码字体
%\newfontfamily\daima{Consolas}

%复制listings生成的代码时不复制行号
\usepackage{accsupp}
\newcommand{\emptyaccsupp}[1]{\BeginAccSupp{ActualText={}}#1\EndAccSupp{}}

%是全局设置，少量定义，给行内代码展示用
\lstset{%
    breaklines,
}

%提供一个代码环境的基本样式
\lstdefinestyle{CodeBase}
{%
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
    numberstyle=\small\ttfamily\emptyaccsupp,
    rulecolor=\color{blue!50!black},
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
    keywordstyle=\bfseries\color{blue!50!black},
    commentstyle=\ttfamily\slshape\color{black!60},
    }

%LaTeX代码环境用
\lstdefinestyle{LaTeX}
{%
    style=CodeBase,
    language=[LaTeX]TeX,
    texcsstyle=*\color{blue!50!black}\bfseries,%反斜杠高亮
    morekeywords={addplot, begin, end, color, text},
    }
%定义latex代码专用环境
\lstnewenvironment{latex}{\lstset{style=LaTeX}}{}

%matlab代码展示
\lstdefinestyle{Matlab}{%
    style=CodeBase,
    language=Matlab
    }
\lstnewenvironment{Matlab}[1]{\lstset{style=Matlab}}{}

%python代码展示
\lstdefinestyle{python}{%
    style=CodeBase,
    keywordstyle=\slshape\color[RGB]{0,0,255},
    language=Python,
    morekeywords={def},
    }
\lstnewenvironment{python}[1]{\lstset{style=python}}{}

%注意环境
\newcommand{\note}[1]{{%
    {\bfseries 注意：}\textit{#1}}}

%命令环境，\cmd{}直接输出命令加反斜杠，避免麻烦
\DeclareRobustCommand*\cmd[1]{\textrm{~\char`\\#1}}
\def\crcmd{\cmd{\char`\\}}

%行内代码环境
%\newcommand{\code}[1]{\rmfamily\lstinline|#1|}


%===============构建一个左边显示代码，右边显示编译结果的代码展示环境====================
\lstdefinestyle{codeshow}
{%
    basicstyle=\small\ttfamily,%\ttfamily等宽字体
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

\tcbuselibrary{listings,skins,breakable}
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

\newtcbox{\pkg}[1][white]{%
    on line,
    arc=0mm,%内弧
    outer arc=0mm,%外弧
    boxrule=1pt,
        left=0pt,
        right=0pt,
        top=0pt,
        bottom=0pt,
    }

%利用tikz画一组带圈数字
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep=1pt]
        (char) {\phantom{\ifblank{#1}{#2}{#1}}};%
        \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}
%在列表内，产生一组自动编号的带圈数字，需要同时指定列表标签为\dcircled{\arabic*}
\newcommand{\dcircled}[1]{\circled[00]{#1}}

%====================最后放置链接宏包，避免冲突===============================
\usepackage{hyperref}
\hypersetup{%
    bookmarksopen=true,%展开书签
    bookmarksnumbered=true,%显示书签编号
    unicode=true,%使书签支持unicode字符
    breaklinks=true,%链接自动换行
    colorlinks=true,%加颜色区分链接
    citecolor=black,%文献序号颜色
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

\urlstyle{rm}%更改链接字体为罗马字体，hyperref宏包调用了url宏包，所以要这样设置