(package-install-unless-installed 'el-get)
(require 'el-get)

;; ensure currently installed packages will be initialized
(el-get 'sync)
