(package-install-unless-installed 'magit)
(require 'magit)
(global-set-key (kbd "C-c C-SPC") 'magit-status)
