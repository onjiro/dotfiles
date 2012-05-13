(add-to-list 'default-frame-alist '(alpha . 85))
(global-linum-mode t)
(tool-bar-mode 0)
(show-paren-mode 1)
(setq load-path (cons "~/.emacs.d/elisp" load-path))
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

;;; install.el の設定
(require 'install-elisp)

;;; auto-install.el の設定
(setq install-elisp-repository-directory "~/.emacs.d/")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

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

;; gist el
(add-to-list 'load-path "~/.emacs.d/vendor/gist.el")
(require 'gist)
(setq github-user "onjiro")
;; github-token must to be secret
;; describe following on ~/.githubtoken
;;   (setq github-token "api token")
(load-file "~/.githubtoken")

;; to use curl
(setq gist-use-curl t)

;; undo-tree.el
(add-to-list 'load-path "~/.emacs.d/vendor/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode)
