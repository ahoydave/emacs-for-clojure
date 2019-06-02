(add-to-list 'load-path (expand-file-name "/path/to/evil-collection/" user-emacs-directory))

(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init))

;; evil-leader
;; (require 'evil-leader)
;; (evil-leader/set-leader "<SPC>")
;; (evil-leader/set-key
;;   "e" 'find-file
;;   "b" 'switch-to-buffer
;;   "k" 'kill-buffer)

(evil-mode t)
