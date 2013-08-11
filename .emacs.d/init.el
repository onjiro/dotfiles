(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; package.el を利用してインストール
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; init-loader.el を利用して設定を分割
;; "~/.emacs.d/inits" はデフォルトのロードパス
(require 'init-loader)
(setq init-loader-byte-compile t)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;; プラットフォーム判別用ライブラリ
(add-to-list 'load-path "~/.emacs.d/vendor/platform-p")
(require 'platform-p)

(add-to-list 'default-frame-alist '(alpha . 85))
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;; 起動時のウィンドウサイズ
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 40))

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

(put 'set-goal-column 'disabled nil)

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
