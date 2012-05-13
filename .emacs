(add-to-list 'default-frame-alist '(alpha . 85))
(global-linum-mode t)
(tool-bar-mode 0)
(show-paren-mode 1)
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2 indent-tabs-mode nil)

;;; �N�����̃E�B���h�E�T�C�Y
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 40))

;; �F�̎w��
(set-face-foreground 'font-lock-comment-face "brightred")
(set-face-foreground 'font-lock-string-face  "brightmagenta")

;;; �t�H���g�̎w��
(if window-system (
  (set-default-font "Inconsolata-11")
  (set-face-font 'variable-pitch "Inconsolata-11")
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    '("Takao�S�V�b�N" . "unicode-bmp")
                    )
  )
)

;;; ���[�h���C���ɍs���Ɨ񐔂�\��
(line-number-mode 1)
(column-number-mode 1)

;;; �܂�Ԃ��\��ON/OFF
(defun toggle-truncate-lines ()
  "�܂�Ԃ��\�����g�O�����삵�܂�."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)

;;; install.el �̐ݒ�
(require 'install-elisp)

;;; auto-install.el �̐ݒ�
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

;;; ruby�֘A�̐ݒ�
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
;; �~�j�o�b�t�@�ɕ\����, ����, �I�[�o���C����.
(setq ruby-block-highlight-toggle t)

;;; scala���[�h�p�Ƀ��[�h�p�X��ǉ�
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

;; capitalize �� backword �œK�p
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
