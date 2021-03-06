(el-get-bundle! 'ruby-mode)
(el-get-bundle! 'ruby-end)
(el-get-bundle! 'ruby-block)
(el-get-bundle 'inf-ruby)


(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          (lambda () (inf-ruby-keys)))

;; magic-comment 挿入を無効化
(custom-set-variables '(ruby-insert-encoding-magic-comment nil))

(ruby-block-mode t)

;; ミニバッファに表示し, かつ, オーバレイする.
(setq ruby-block-highlight-toggle t)
