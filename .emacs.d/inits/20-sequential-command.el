;; sequential-command を導入
;; 同一キーを複数回押下した場合の挙動を変更可能にする
(el-get-bundle! 'emacswiki:sequential-command)
(el-get-bundle! 'emacswiki:sequential-command-config)
(sequential-command-setup-keys)
