;; popwin でバッファ表示関連をましにする
;; @see http://d.hatena.ne.jp/m2ym/20110120/1295524932
(package-install-unless-installed 'popwin)
(require 'popwin)
(popwin-mode 1)

(setq popwin:special-display-config
  '(("*Help*" :height 30)
    ("*Completions*" :noselect t)
    ("*Messages*" :noselect t :height 30)
    ("*compilation*" :noselect t)
    ("*Backtrace*" :height 30)
    ("*Occur*" :noselect t)
    ("*undo-tree*" :width 0.3 :position right)
    ("^.*helm.+$" :regexp t :position bottom :height 30)
    ("*magit-log*" :position left :width 120 :stick t)
    ("*magit-commit*" :noselect t :height 30 :width 80 :stick t)
    ("*magit-diff*" :noselect t :height 30 :width 80)
    ("*magit-edit-log*" :noselect t :height 15 :width 80)
    ("*magit-process*" :noselect t :height 15 :width 80)
    ))
