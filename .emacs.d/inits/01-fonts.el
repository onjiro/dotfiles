;; 色の指定
(set-face-foreground 'font-lock-comment-face "brightred")
(set-face-foreground 'font-lock-string-face  "brightmagenta")

;;; フォントの指定
(if window-system (
  (set-default-font "Inconsolata-11")
  (set-face-font 'variable-pitch "Inconsolata-11")
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    '("Takaoゴシック" . "unicode-bmp")
                    )
  )
)

