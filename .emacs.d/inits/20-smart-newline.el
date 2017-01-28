(el-get-bundle 'ainame/smart-newline.el
  :features(smart-newline))
(define-key global-map (kbd "RET") 'smart-newline)
