\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{math}
[2023/02/08 v0.2 Standard LaTeX Template for math Report]
\LoadClass[UTF8,a4paper]{ctexart}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage[most,minted]{tcolorbox}
\RequirePackage{minted}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{float}
\RequirePackage{indentfirst}
\RequirePackage{zhnumber}
\RequirePackage{booktabs}
\RequirePackage{todonotes}

\geometry{a4paper,top=2.54cm,bottom=2.54cm,left=3.17cm,right=3.17cm}

\unimathsetup{math-style=ISO, bold-style=ISO}

% ==============================================================================
% Options and Declarations
% ==============================================================================
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
% ------------------------------------------------------------------------------
%   Define \mathsetup command
%
%   Following key-value setup mechanism is adapted from `thuthesis'.
%   thuthesis (https://github.com/xueruini/thuthesis) is licensed under the
%   conditions of the LaTeX Project Public License, either version 1.3. 
% ------------------------------------------------------------------------------
\newcommand\mathsetup{%
  \kvsetkeys{math}%
}
\newcommand\math@define@key[1]{%
  \kvsetkeys{math@key}{#1}%
}
\kv@set@family@handler{math@key}{%
  \@namedef{math@#1@@name}{#1}%
  \def\math@@default{}%
  \def\math@@choices{}%
  \kv@define@key{math@value}{name}{%
    \@namedef{math@#1@@name}{##1}%
  }%
  \kv@define@key{math@value}{code}{%
    \@namedef{math@#1@@code}{##1}%
  }%
  \@namedef{math@#1@@check}{}%
  \@namedef{math@#1@@code}{}%
  \@namedef{math@#1@@hook}{%
    \expandafter\ifx\csname\@currname.\@currext-h@@k\endcsname\relax
      \@nameuse{math@#1@@code}%
    \else
      \AtEndOfClass{%
        \@nameuse{math@#1@@code}%
      }%
    \fi
  }%
  \kv@define@key{math@value}{choices}{%
    \def\math@@choices{##1}%
    \@namedef{math@#1@@reset}{}%
    \@namedef{math@#1@@check}{%
      \@ifundefined{%
        ifmath@\@nameuse{math@#1@@name}@\@nameuse{math@\@nameuse{math@#1@@name}}%
      }{%
        \math@error{Invalid value "#1 = \@nameuse{math@\@nameuse{math@#1@@name}}"}%
      }%
      \@nameuse{math@#1@@reset}%
      \@nameuse{math@\@nameuse{math@#1@@name}@\@nameuse{math@\@nameuse{math@#1@@name}}true}%
    }%
  }%
  \kv@define@key{math@value}{default}{%
    \def\math@@default{##1}%
  }%
  \kvsetkeys{math@value}{#2}%
  \@namedef{math@\@nameuse{math@#1@@name}}{}%
  \kv@set@family@handler{math@choice}{%
    \ifx\math@@default\@empty
      \def\math@@default{##1}%
    \fi
    \expandafter\newif\csname ifmath@\@nameuse{math@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname math@#1@@reset\endcsname{%
      \@nameuse{math@\@nameuse{math@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{math@choice}{\math@@choices}%
  \expandafter\let\csname math@\@nameuse{math@#1@@name}\endcsname\math@@default
  \expandafter\ifx\csname math@\@nameuse{math@#1@@name}\endcsname\@empty\else
    \@nameuse{math@#1@@check}%
    \@nameuse{math@#1@@hook}%
  \fi
  \kv@define@key{math}{#1}{%
    \@namedef{math@\@nameuse{math@#1@@name}}{##1}%
    \@nameuse{math@#1@@check}%
    \@nameuse{math@#1@@hook}%
  }%
}

\math@define@key{
  title = {
    default = {??????????????????????????????},
  },
  sub-title = {
    default = {????????????},
    name = sub@title,
  },
  student = {
    default = {??????}
  },
  student-id = {
    default = {2022****},
    name    = student@id,
  },
  institution = {
    default = {?????????????????????},
  },
  discipline = {
    default = {??????????????????????????? 2022 ???},
  },
  date = {
    default = {2023 ??? 2 ??? 8 ???},
  },
}

% ?????????
\linespread{1.25}

% ??????????????????
% \newcommand{\??????}{\zihao {0}}
% \newcommand{\??????}{\zihao{-0}}
% \newcommand{\??????}{\zihao {1}}
% \newcommand{\??????}{\zihao{-1}}
% \newcommand{\??????}{\zihao {2}}
% \newcommand{\??????}{\zihao{-2}}
% \newcommand{\??????}{\zihao {3}}
% \newcommand{\??????}{\zihao{-3}}
% \newcommand{\??????}{\zihao {4}}
% \newcommand{\??????}{\zihao{-4}}
% \newcommand{\??????}{\zihao {5}}
% \newcommand{\??????}{\zihao{-5}}
% \newcommand{\??????}{\zihao {6}}
% \newcommand{\??????}{\zihao{-6}}
% \newcommand{\??????}{\zihao {7}}
% \newcommand{\??????}{\zihao {8}}
% ??????????????????
\xeCJKsetup{EmboldenFactor=2.5} % ???????????????
% ????????????
\renewcommand{\songti}{\CJKfontspec[Path=fonts/,FallBack=simsunb.ttf,AutoFakeBold]{simsun.ttc}}
\setCJKmainfont[Path=fonts/,FallBack=simsunb.ttf,AutoFakeBold]{simsun.ttc} % ?????????????????????,?????????\documentclass?????????
% \newcommand{\??????}{\songti}
% ??????
\renewcommand{\heiti}{\CJKfontspec[Path=fonts/,AutoFakeBold]{simhei.ttf}}
\setCJKsansfont[Path=fonts/]{simhei.ttf}
% \newcommand{\??????}{\heiti}
% % ??????
% \newcommand{\??????}{\fangsong}
% \newcommand{\??????}{\kaishu}
% \newcommand{\??????}{\lishu}
% \newcommand{\??????}{\youyuan}
% \newcommand{\??????}{\yahei}
% \newcommand{\??????}{\pingfang}
% % ????????????????????????
% \newcommand{\??????}{\bfseries}
% \newcommand{\??????}{\itshape}


% ??????????????????
\ctexset{
  % ????????????ctexart?????????????????????????????????
  section = {
    % format??????????????????????????????????????????????????????????????????
		% ?????????????????????????????????????????????
		% +?????????????????????????????????????????????
		format+ = \zihao{-3} \heiti \raggedright,
		% name???????????????????????????????????????
		% ?????????????????????????????????,??????
		% ???????????????????????????????????????
		name = {,???},
		% number??????????????????????????????????????????
		% ??????section???????????????
		number = \chinese{section},
		% beforeskip??????????????????????????????????????????
		% ex????????????????????????x?????????
		% ???????????????1.0ex??????????????????1.2ex?????????????????????0.8ex
		beforeskip = 1.0ex plus 0.2ex minus .2ex,
		% afterskip??????????????????????????????????????????
		afterskip = 1.0ex plus 0.2ex minus .2ex,
		% aftername??????????????????????????????????????????
		% \hspace????????????????????????
		aftername = \hspace{0pt}
  },
  subsection = {
    name = {,.{ } },
    number = \arabic{subsection},
    % ????????????
    format+ = \zihao{4} \songti \raggedright,
		beforeskip = 1.0ex plus 0.2ex minus .2ex,
		afterskip = 1.0ex plus 0.2ex minus .2ex,
		aftername = \hspace{0pt}
  },
  subsubsection = {
    number = \arabic{subsubsection},
    % ????????????
    format+ = \zihao{-4} \songti \raggedright,
		beforeskip = 1.0ex plus 0.2ex minus .2ex,
		afterskip = 1.0ex plus 0.2ex minus .2ex,
		aftername = \hspace{0pt}
  },
}

% ???????????????????????????
\graphicspath{{figures/}{figure/}{pictures/}%
{picture/}{pic/}{pics/}{image/}{images/}}


% ???????????????????????????
\usemintedstyle{emacs}


% ??????
\pagestyle{fancy}
\lhead{???????????????????????????????????????}
\chead{?????????\math@student}
\rhead{?????????\math@student@id}
\setlength{\headheight}{13pt}


% ??????
\newcommand{\makecover}{
  \begin{center}
    \heiti
    \bfseries\zihao{-0}{\math@title}\\
    \vskip 30pt
    \bfseries\songti\zihao{1}{\math@sub@title} \\
    \vskip 60pt
    \begin{center}
      \includegraphics[width=0.4\linewidth]{shiep-logo}
    \end{center}
	\vskip 60pt
    \begin{center}
		\begin{large}
			\zihao{-3}
			\begin{tabular}{rc}
				???\qquad ??????& \math@institution\\
						\cline{2-2}\\
				???????????????& \math@discipline\\
				\cline{2-2}\\
				???\qquad ??????& \math@student\\
				\cline{2-2}\\
				???\qquad ??????&\hspace{2.5cm} \math@student@id \hspace{2.5cm} \\
				\cline{2-2}
			\end{tabular}
		\end{large}
	\end{center}
    \vskip 60pt
    \zihao{4}{\math@date}
  \end{center}
  \thispagestyle{empty}
  \newpage
  \setcounter{page}{1}
}

