(setq el-get-sources '(
        (:name smart-newline
               :type github
               :website "https://github.com/ainame/smart-newline.el"
               :pkgname "ainame/smart-newline.el")
        )
)
(el-get-install 'smart-newline)

(smart-newline-mode 1)
(define-key global-map (kbd "C-j") 'smart-newline)
(define-key global-map (kbd "C-m") 'smart-newline)
