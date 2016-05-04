(el-get-bundle 'alezost/imenus.el
  :features (imenus))
(global-set-key (kbd "M-i") 'imenus)

;;; http://rubikitch.com/2015/04/09/imenus/
;;; エラー対策
(defun imenu-find-default--or-current-symbol (&rest them)
  (condition-case nil
      (apply them)
    (error (thing-at-point 'symbol))))
(advice-add 'imenu-find-default :around 'imenu-find-default--or-current-symbol)
;;; なぜか現在のシンボルを取ってくれないから
(defun imenus-exit-minibuffer ()
  (exit-minibuffer))
