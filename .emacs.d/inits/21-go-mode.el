(package-install-unless-installed 'go-mode)

(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
