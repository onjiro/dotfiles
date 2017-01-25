;;; win-switch.el --- C-o o o ...で連続してウィンドウの移動を可能にする
(el-get-bundle 'genovese/win-switch
  :url "https://raw.githubusercontent.com/genovese/win-switch/master/win-switch.el"
  ;; 0.75秒間受け付けるタイマー
  (setq win-switch-idle-time 1)
  ;; 好きなキーを複数割り当てられる
  ;; ウィンドウ切り替え
  (win-switch-set-keys '("k") 'up)
  (win-switch-set-keys '("j") 'down)
  (win-switch-set-keys '("h") 'left)
  (win-switch-set-keys '("l") 'right)
  (win-switch-set-keys '("o") 'next-window)
  (win-switch-set-keys '("p") 'previous-window)
  ;; リサイズ
  (win-switch-set-keys '("K") 'enlarge-vertically)
  (win-switch-set-keys '("J") 'shrink-vertically)
  (win-switch-set-keys '("H") 'shrink-horizontally)
  (win-switch-set-keys '("L") 'enlarge-horizontally)
  ;; 分割
  (win-switch-set-keys '("3") 'split-horizontally)
  (win-switch-set-keys '("2") 'split-vertically)
  (win-switch-set-keys '("0") 'delete-window)
  ;; その他
  (win-switch-set-keys '(" ") 'other-frame)
  (win-switch-set-keys '("u" [return]) 'exit)
  (win-switch-set-keys '("\M-\C-g") 'emergency-exit)
  ;; C-x oを置き換える
  (global-set-key (kbd "C-x o") 'win-switch-dispatch))
