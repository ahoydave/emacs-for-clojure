;;;;
;; Clojure
;;;;

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook 'enable-paredit-mode)
;; (add-hook 'clojure-mode-hook 'lispy-mode)
;; (add-hook 'cider-repl-mode-hook 'lispy-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
;; (add-hook 'clojure-mode-hook 'subword-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; syntax hilighting for midje
;; (add-hook 'clojure-mode-hook
;;           (lambda ()
;;             (setq inferior-lisp-program "lein repl")
;;             (font-lock-add-keywords
;;              nil
;;              '(("(\\(facts?\\)"
;;                 (1 font-lock-keyword-face))
;;                ("(\\(background?\\)"
;;                 (1 font-lock-keyword-face))))
;;             (define-clojure-indent (fact 1))
;;             (define-clojure-indent (facts 1))
;;             (rainbow-delimiters-mode)))

;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
;; (add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
;; (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))  <-- actually want clojurescript-mode here
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;; clojure linting
(require 'flycheck-joker)
(add-hook 'clojure-mode-hook 'company-mode)
(add-hook 'clojure-mode-hook 'flycheck-mode)

(setq cider-default-cljs-repl 'figwheel)
(setq cider-prompt-for-symbol nil)

;; set up formatting buffer on save
(defun cider-format-buffer-back () (interactive)
  (let (p)
    (setq p (point))
    (cider-format-buffer)
    (goto-char p))
  )

(defun add-clj-format-before-save () (interactive)
       (add-hook 'before-save-hook
                 'cider-format-buffer-back
                 t t))

(add-hook 'clojure-mode-hook
          'add-clj-format-before-save)
