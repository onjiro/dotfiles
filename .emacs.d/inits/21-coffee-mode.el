(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(add-hook 'coffee-mode-hook
          (lambda ()
            (key-combo-define-local (kbd "-") '("-" "->"))
            (auto-complete-mode 1)
            ))
