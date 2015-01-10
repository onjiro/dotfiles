(require 'haml-mode)
(autoload 'haml-mode "haml-mode"
  "Mode for editing haml source files" t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
