;;; 20-flycheck.el --- flycheck settings

(el-get-bundle! 'pos-tip)
(el-get-bundle 'flycheck)
(el-get-bundle! 'flycheck-tip)
(define-key your-prog-mode (kbd "C-c C-n") 'flycheck-tip-cycle)
(flycheck-tip-use-timer 'verbose)

(add-hook 'after-init-hook #'global-flycheck-mode)

(global-set-key (kbd "C-.") 'flycheck-next-error)
(global-set-key (kbd "C-,") 'flycheck-previous-error)

;;;
;;; 20-flycheck ends here
