;;; マウスホイール有効化
;; @see http://d.hatena.ne.jp/sabottenda/20120602/1338643214
(unless (fboundp 'track-mouse)
  (defun track-mouse (e)))
(xterm-mouse-mode t)
(require 'mouse)
(require 'mwheel)
(mouse-wheel-mode t)

;; マウスホイールでスクロール
;; @see http://d.hatena.ne.jp/supermassiveblackhole/20100908/1283910730
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 1))
(defun scroll-up-with-lines ()
   "" (interactive) (scroll-up 1))
(global-set-key [mouse-4] 'scroll-down-with-lines)
(global-set-key [mouse-5] 'scroll-up-with-lines)

