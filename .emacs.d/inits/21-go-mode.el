(package-install-unless-installed 'go-mode)

(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

;;; exclude go file from auto-save-buffers-enhanced
(push ".+\.go$" auto-save-buffers-enhanced-exclude-regexps)
