;; ===================================================
;; for Emacs24's package.el
;; @see Known Issue on http://melpa.milkbox.net/
(defadvice package-compute-transaction
  (before package-compute-transaction-reverse (package-list requirements) activate compile)
    "reverse the requirements"
    (setq requirements (reverse requirements))
    (print requirements))
;; ===================================================

(add-to-list 'load-path "~/.emacs.d/site-lisp")
;; install ����Ă��Ȃ��ꍇ�Apackage install ���s��
(defun not-installed(package) (not (package-installed-p package)))
(defun package-install-unless-installed(package)
  (when (not-installed package) (package-install package)))

;; package.el �𗘗p���ăC���X�g�[��
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; init-loader.el �𗘗p���Đݒ�𕪊�
;; "~/.emacs.d/inits" �̓f�t�H���g�̃��[�h�p�X
(require 'init-loader)
(setq init-loader-byte-compile t)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;; �v���b�g�t�H�[�����ʗp���C�u����
(add-to-list 'load-path "~/.emacs.d/vendor/platform-p")
(require 'platform-p)

(add-to-list 'default-frame-alist '(alpha . 85))
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;; �N�����̃E�B���h�E�T�C�Y
(add-to-list 'default-frame-alist '(width . 120))
(add-to-list 'default-frame-alist '(height . 40))

(put 'set-goal-column 'disabled nil)
