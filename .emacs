(with-eval-after-load 'package
 (setq package-archives
  '(("gnu"   . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")))
 (push 'company package-selected-packages)
 (push 'flycheck     package-selected-packages)
 (push 'eglot   package-selected-packages))

;; Environnement
(set-language-environment "UTF-8")

(setq emacs-lisp-dir "~/.emacs.d/"
      my-elmode-dir (concat emacs-lisp-dir "elmodes/"))

(setq display-time-24hr-format t)

;; display lines and columns
(line-number-mode 1)
(column-number-mode 1)

;; turn off tool bars
(menu-bar-mode -1)
;; (tool-bar-mode -1)
;; (scroll-bar-mode -1)

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(with-eval-after-load 'prog-mode
  (add-hook 'prog-mode-hook #'hl-line-mode)
  (add-hook 'prog-mode-hook #'display-line-numbers-mode)
  (add-hook 'prog-mode-hook #'electric-layout-mode)
;  (add-hook 'prog-mode-hook #'electric-pair-mode)
  (add-hook 'prog-mode-hook #'company-mode)
;  (add-hook 'prog-mode-hook #'flycheck-mode)
;  (add-hook 'prog-mode-hook #'flyspell-prog-mode)
  (add-hook 'prog-mode-hook #'show-paren-mode)
  (add-hook 'prog-mode-hook #'eldoc-mode))

(defmacro set-up-c-style-comments ()
 "Set up C-style /* ... */ comments."
 `(with-eval-after-load 'newcomment
   (setq-local comment-style 'extra-line)))

(with-eval-after-load 'cc-vars
 (setq c-mark-wrong-style-of-comment t)
 (setq c-default-style '((other . "user")))
 (setq c-basic-offset 2)
 (add-hook 'c-mode-common-hook (lambda nil (progn (set-up-c-style-comments)))))

;---------;
; Couleur ;
;---------;
(global-font-lock-mode t)
(setq my-back-color "black")
(set-face-foreground 'default "white")
(set-face-background 'default my-back-color)

;------------------;
; File association ;
;------------------;
  (setq auto-mode-alist
        (append '(("\\.tex\\'" . latex-mode)
		  )
		      auto-mode-alist)
  )

;; ensure there is a new line at the end of the file
(setq require-final-newline t)
;; No startup screen
(setq inhibit-startup-screen t)
;; No cursor blinking
(blink-cursor-mode 0)
(setq-default indent-tabs-mode nil)

(defvar show-paren-delay 0)
(defvar show-paren-style 'expression)
(show-paren-mode 1)

(transient-mark-mode t)
(setq search-highlight t)
(setq visible-bell t)
(setq bell-volume 10)

(setq next-line-add-newlines nil)

(define-key global-map [delete] 'delete-char)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(lua-mode eglot flycheck company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
