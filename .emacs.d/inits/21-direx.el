;; @see http://cx4a.blogspot.jp/2011/12/popwineldirexel.html
(package-install-unless-installed 'direx)
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
