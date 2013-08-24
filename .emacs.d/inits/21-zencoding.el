;; zencoding.el
(package-install-unless-installed 'zencoding-mode)
(require 'zencoding-mode)
(add-hook 'html-mode-hook 'zencoding-mode)
