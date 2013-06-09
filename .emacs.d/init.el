;; プラットフォーム判別用ライブラリ
(add-to-list 'load-path "~/.emacs.d/vendor/platform-p")
(require 'platform-p)

(add-to-list 'default-frame-alist '(alpha . 85))
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(require 'linum)
(global-linum-mode t)
(if tool-bar-mode
  (tool-bar-mode 0)
)
(if menu-bar-mode
  (menu-bar-mode -1)
)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2 indent-tabs-mode nil)

;;; 起動時のウィンドウサイズ
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 40))

;; 色の指定
(set-face-foreground 'font-lock-comment-face "brightred")
(set-face-foreground 'font-lock-string-face  "brightmagenta")

;;; フォントの指定
(if window-system (
  (set-default-font "Inconsolata-11")
  (set-face-font 'variable-pitch "Inconsolata-11")
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    '("Takaoゴシック" . "unicode-bmp")
                    )
  )
)

;;; モードラインに行数と列数を表示
(line-number-mode 1)
(column-number-mode 1)

;;; 折り返し表示ON/OFF
(defun toggle-truncate-lines ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)

;;; マウスホイール有効化
;; @see http://d.hatena.ne.jp/sabottenda/20120602/1338643214
(unless (fboundp 'track-mouse)
  (defun track-mouse (e)))
(xterm-mouse-mode t)
(require 'mouse)
(require 'mwheel)
(mouse-wheel-mode t)

;; マウスホイールでスクロール
;; @see http://d.hatena.ne.jp/supermassiveblackhole/20100908/1283910730
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 1))
(defun scroll-up-with-lines ()
   "" (interactive) (scroll-up 1))
(global-set-key [mouse-4] 'scroll-down-with-lines)
(global-set-key [mouse-5] 'scroll-up-with-lines)

;;; install.el の設定
(require 'install-elisp)

;;; auto-install.el の設定
(setq install-elisp-repository-directory "~/.emacs.d/")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/auto-install/")
(add-to-list 'load-path "~/.emacs.d/elisp/auto-install")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;;; anything
(require 'anything-startup)
;; my-anything-filelist+
;; http://d.hatena.ne.jp/klon/20110823/1314093471
(defun my-anything-filelist+ ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-files-in-current-dir+
     anything-c-source-buffers+
     anything-c-source-recentf
     anything-c-source-mac-spotlight
     anything-c-source-locate)
   " *my-anything-filelist+*"))
;
(global-set-key "\C-x\C-b" 'anything-buffers+)
(global-set-key "\C-x\C-f" 'my-anything-filelist+)
(global-set-key "\C-x\C-v" 'find-file)

;; haml-mode
(require 'haml-mode)
(autoload 'haml-mode "haml-mode"
  "Mode for editing haml source files" t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;;; ruby関連の設定
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda () (inf-ruby-keys)))

;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
;; ミニバッファに表示し, かつ, オーバレイする.
(setq ruby-block-highlight-toggle t)

;;; scalaモード用にロードパスを追加
(add-to-list 'load-path "~/.emacs.d/scala-mode")
    (require 'scala-mode-auto)

;; Load the ensime lisp code...
;;(add-to-list 'load-path "~/etc/ensime/elisp/")
;;(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; MINI HOWTO:
;; Open .scala file. M-x ensime (once per project)
(put 'scroll-left 'disabled nil)

;; capitalize を backword で適用
(global-set-key "\M-C" 'capitalize-backward-word)
(defun capitalize-backward-word (arg)
  "Capitalize previous word (or arg words)."
  (interactive "p")
  (capitalize-word (- arg)))

;; coffee mode
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(put 'set-goal-column 'disabled nil)

;; stylus mode
(require 'sws-mode)
(require 'stylus-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))

;; sass mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))


;; gh.el
(add-to-list 'load-path "~/.emacs.d/vendor/pcache")
(add-to-list 'load-path "~/.emacs.d/vendor/logito")
(add-to-list 'load-path "~/.emacs.d/vendor/gh.el")
(require 'gh)

;; gist el
;;(add-to-list 'load-path "~/.emacs.d/vendor/gist.el")
;;(require 'gist)
;;(setq github-user "onjiro")
;; github-token must to be secret
;; describe following on ~/.githubtoken
;;   (setq github-token "api token")
;;(load-file "~/.githubtoken")

;; to use curl
(setq gist-use-curl t)

;; undo-tree.el
(add-to-list 'load-path "~/.emacs.d/vendor/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode)

;; zencoding.el
(add-to-list 'load-path "~/.emacs.d/vendor/zencoding")
(require 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)

;; magit
(add-to-list 'load-path "~/.emacs.d/vendor/magit")
(require 'magit)

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
(require 'auto-complete-config)
(ac-config-default)

;; php-mode
(require 'php-mode)
(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
            (c-set-offset 'case-label' 2)
            (c-set-offset 'arglist-intro' 2)
            (c-set-offset 'arglist-cont-nonempty' 2)
            (c-set-offset 'arglist-close' 0)))

;; ;; white-space
;; ;; タブと全角空白のみ表示
;; (autoload 'whitespace-mode           "whitespace"
;;   "Toggle whitespace visualization."        t)
;; (autoload 'whitespace-toggle-options "whitespace"
;;   "Toggle local `whitespace-mode' options." t)
;; (setq whitespace-style '(face tabs tab-mark spaces space-mark))
;; (setq whitespace-display-mappings
;;       '((space-mark ?\u3000 [?\u25a1])
;;         ;; warning: the mapping below has a problem.
;;         ;; when a tab occupies exactly one colun, it will display the
;;         ;; charactor ?\xBB at that column followed by a tab which goes to
;;         ;; the next tab column.
;;         ;; if this is a problem for you, please, comment the line below.
;;         (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
;; (setq whitespace-space-regexp "\\(\u3000+\\)")
;; (set-face-foreground 'whitespace-tab "#adff2f")
;; (set-face-background 'whitespace-tab 'nil)
;; (set-face-underline  'whitespace-tab t)
;; (set-face-foreground 'whitespace-space "#7cfc00")
;; (set-face-background 'whitespace-space 'nil)
;; (set-face-bold-p     'whitespace-space t)
;; (global-whitespace-mode 1)
;; (global-set-key (kbd "C-x w") 'global-whitespace-mode)
