(add-to-list 'auto-mode-alist '("\\.html.erb$" . html-mode))
(add-hook 'html-mode-hook
          (lambda ()
            (key-combo-define-local (kbd "<!") "<!-- `!!' -->")
            (key-combo-define-local (kbd "<%") "<%`!!' %>")
            ))
