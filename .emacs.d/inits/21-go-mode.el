(el-get-bundle! 'go-mode)

;;; exclude go file from auto-save-buffers-enhanced
(push ".+\.go$" auto-save-buffers-enhanced-exclude-regexps)

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook
          (lambda ()
            (key-combo-define-local (kbd ":") '(":" " := " "::"))
            ))
