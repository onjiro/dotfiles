(require 'auto-save-buffers-enhanced)
(auto-save-buffers-enhanced t)
(setq auto-save-buffers-enhanced-include-regexps '(".+"))
(setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))
