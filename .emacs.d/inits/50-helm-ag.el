(el-get-bundle 'helm-ag)

(custom-set-variables
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-insert-at-point 'symbol))

;; with C-u prefix, search folder selectable
(global-set-key (kbd "C-c C-f") 'helm-ag)

