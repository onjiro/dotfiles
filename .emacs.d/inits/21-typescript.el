;; tss.el に同梱の typescript.el を利用する
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tss)

;; キーバインド
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

;; 必要に応じて適宜カスタマイズして下さい。以下のS式を評価することで項目についての情報が得られます。
;; (customize-group "tss")

;; 推奨設定を行う
(tss-config-default)
