(el-get-bundle! 'mooz/js2-mode)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(add-hook 'js2-mode-hook (lambda ()
                           (auto-complete-mode 1)
                           (setq js2-basic-offset 2)))

;; jsx-mode
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
(add-hook 'js2-jsx-mode-hook (lambda ()
                               (auto-complete-mode 1)
                               (setq sgml-attribute-offset 2)))
