(show-paren-mode 1)
;;(setq show-paren-style 'expression)
(setq show-paren-style 'parenthesis)
;; show the time
(setq system-time-locale "C")
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-default-load-average nil)
(setq display-time-load-average-threshold 10000)
(setq display-time-format "%m-%d W%w-%a %H:%M")
(when (string-equal system-type "windows-nt")
  (let (
        (mypaths
         '(
           "."
           "C:/texlive/2015/bin/win32"
           ;;"C:/Emacs/bin"
           "C:/Emacs64/bin"
           "~/.spacemacs.d/zclbin"
           "~/.spacemacs.d/zclbin/glo65wb/bin"
           ;;"C:/cygwin64/bin"
           "C:/Git/cmd"
           "C:/Git/usr/bin"
           "C:/Git/migw64/bin"
           "C:/LLVM/bin"
           "C:/Users/cliyh/Anaconda3"
           "C:/Users/cliyh/Anaconda3/Scripts"
           "C:/TDM-GCC-64/bin"
           "C:/tools/LLVM/bin"
           "C:/tools/CMake/bin"
           "C:/tools/octave-4.2.1/bin"
           "C:/Java/jdk1.8.0_121/bin"
           "C:/Java/apache-maven-3.3.9-bin"
           "C:/Users/cliyh/AppData/Local/GitHub/PortableGit_f02737a78695063deace08e96d5042710d3e32db/cmd"
           )))
    (setenv "PATH" (mapconcat 'identity mypaths ";") )
    (setq exec-path (append mypaths (list "." exec-directory)))))

;; ido
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))




(setq Tex-parse-self t)
(setq TeX-show-compilation t);;显示编译信息便于纠错
(setq LaTeX-math-menu-unicode t)
(setq my-tex-commands-extra (list
    (list "XeLaTeX" "xelatex \"%s.tex\"  " 'TeX-run-command nil t)
    (list "dvipdfm" "dvipdfm \"%s.dvi\"  " 'TeX-run-command nil t)
    (list "dvips" "dvi2ps \"%s.dvi\"  " 'TeX-run-command nil t)
    (list "pdflatex" "pdflatex \"%s.tex\"  " 'TeX-run-command nil t)
    (list "view" "SumatraPDF.exe \"%s.pdf\"  " 'TeX-run-command nil t)
    (list "gbk2uni" "gbk2uni.exe \"%s.out\"  " 'TeX-run-command nil t)
    (list "sumatrapdf" "SumatraPDF.exe \"%s.pdf\"  " 'TeX-run-command nil t)
    (list "ps2pdf" "ps2pdf \"%s.ps\" " 'TeX-run-command nil t)))
;;(autoload 'tex "tex" "edit the tex file")
(setq-default TeX-command-list (append TeX-command-list my-tex-commands-extra))
;;(setq TeX-engine 'pdflatex);;设置latex引擎
(when (string-equal system-type "gnu/linux")
  (setq TeX-engine 'xetex);;设置latex引擎
  )
(setq TeX-engine 'xetex);;设置latex引擎
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pdf view pragramm;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq TeX-view-program-list
;      '(("acroread" "acroread %o")))
(when (string-equal system-type "gnu/linux")
  (add-hook 'LaTeX-mode-hook
            (lambda()
              ;;(add-to-list 'TeX-command-list '("PdfLaTeX" "%`pdflatex%(mode)%' %t" TeX-run-TeX nil t))
              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-default "XeLaTeX")))
  )
(when (string-equal system-type "windows-nt")
  (add-hook 'LaTeX-mode-hook
            (lambda()
              (add-to-list 'TeX-command-list '("PdfLaTeX" "%`pdflatex%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-default "pdflatex")))
  )

(setq reftex-plug-into-AUCTeX t)
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t )
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(spacemacs|diminish reftex-mode "Ⓡ" "R")
(spacemacs|diminish ggtags-mode "Ⓖ" "G")
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" t)
(autoload 'reftex-citation "reftex-cite" "Make citation" t)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(setq reftex-toc-split-windows-horizontally t);;*toc*buffer 在左侧。
(setq reftex-toc-split-windows-fraction 0.4);;*toc*buffer 使用整个frame 的比例。
;;(add-hook 'bibtex-mode-hook 'turn-on-auto-revert-mode);;自动更新bibtex数据库
(setq reftex-texpath-environment-variables;;set the direcotry to find the .tex files
      '("./tex//:../tex//:.//"))
(setq reftex-bibpath-environment-variables;;set the directory to find the .bib files
      '("./bib//:../bib//:.//"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pdf view pragramm;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cond
 ((eq system-type 'windows-nt)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "sumatrapdf"))))))

 ((eq system-type 'gnu/linux)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "Evince")
                                                 (output-dvi "Okular")))))))
(when (string-equal system-type "windows-nt")
  (setq TeX-view-program-list
        '(("sumatrapdf" "SumatraPDF.exe %o")
          ("Firefox" "firefox %o"))))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
