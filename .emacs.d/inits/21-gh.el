(dolist (package '(
  pcache
  logito
  gh
)) (package-install-unless-installed package))
(require 'gh)
