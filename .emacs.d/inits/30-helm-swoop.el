;;; helm-swoom.el --- buffer 全体をmigemo検索する

(el-get-bundle! 'emacs-jp/helm-migemo)

;; helm-swoop の設定
;;; isearchからの連携を考えてC-r/C-sにも割り当て
(el-get-bundle! 'helm-swoop)
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)

;;; 検索結果をcycleしない
(setq helm-swoop-move-to-line-cycle nil)

(cl-defun helm-swoop-nomigemo (&key $query ($multiline current-prefix-arg))
  "シンボル検索用Migemo無効版helm-swoop"
  (interactive)
  (let ((helm-swoop-pre-input-function
         (lambda () (format "\\_<%s\\_> " (thing-at-point 'symbol)))))
    (helm-swoop :$source (delete '(migemo) (copy-sequence (helm-c-source-swoop)))
                :$query $query :$multiline $multiline)))
;;; C-M-:に割り当て
(global-set-key (kbd "C-M-:") 'helm-swoop-nomigemo)

(when (featurep 'helm-anything)
  (defadvice helm-resume (around helm-swoop-resume activate)
    "helm-anything-resumeで復元できないのでその場合に限定して無効化"
    ad-do-it))

;; ace-issearch の設定
(el-get-bundle! 'avy)
(el-get-bundle! 'ace-isearch)
(global-ace-isearch-mode 1)

(custom-set-variables
 '(ace-isearch-jump-delay 1)
 '(ace-isearch-input-length 100))


;;; isearchとの併合
(defun isearch-forward-or-helm-swoop (use-helm-swoop)
  (interactive "p")
  (let (current-prefix-arg
        (helm-swoop-pre-input-function 'ignore))
    (call-interactively
     (case use-helm-swoop
       (1 'isearch-forward)
       (4 'helm-swoop)
       (16 'helm-swoop-nomigemo)))))

(global-set-key (kbd "C-s") 'isearch-forward-or-helm-swoop)
