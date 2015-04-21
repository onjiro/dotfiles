(add-hook 'html-mode-hook
          (lambda()
            (autopair-mode 0)
            (key-combo-define-local (kbd ",") '("," "<`!!'>" "<!-- `!!' -->" "<% `!!' %>" "<%= `!!' %>"))
            ))
