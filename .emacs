;; Environnement
(set-language-environment "UTF-8")

(setq emacs-lisp-dir "~/.emacs.d/"
      my-elmode-dir (concat emacs-lisp-dir "elmodes/"))

(setq load-path
      (append load-path
	      (list my-elmode-dir)))

(setq inhibit-default-init t)

(setq display-time-24hr-format t)
(display-time)

;; display lines and columns
(line-number-mode 1)
(column-number-mode 1)

;; turn off tool bars
(menu-bar-mode -1)
;; (tool-bar-mode -1)
;; (scroll-bar-mode -1)

;; show parenthesis match
(defvar show-paren-delay 0)
(defvar show-paren-style 'expression)
(show-paren-mode 1)

(transient-mark-mode t)
(setq search-highlight t)

(setq gc-cons-threshold (max 500000 gc-cons-threshold))

(setq max-lisp-eval-depth (max 2000 max-lisp-eval-depth))
(setq max-specpdl-size (max 2000 max-specpdl-size))

(setq backup-inhibited t)

(setq-default case-fold-search nil)

(setq visible-bell t)
(setq bell-volume 10)

(setq next-line-add-newlines nil)

(setq minibuffer-confirm-incomplete t)
(setq next-screen-context-lines 1)
(setq minibuffer-max-depth nil)
(setq find-file-compare-truenames t)

(put 'narrow-to-region 'disabled nil)

(setq enable-recursive-minibuffers t)

(global-set-key [S-iso-lefttab] 'hippie-expand)

(global-set-key [f4] 'gnus)

(global-set-key [f2] 'iso-accents-mode)

(define-key global-map [delete] 'delete-char)

(define-key global-map [(meta l)] 'goto-line)
(global-set-key [(control tab)] 'other-window)

(defun my-kill-buffer ()
  "kill buffer sans confirmation"
  (interactive)
  (kill-buffer nil))

(global-set-key [(control x) ?k] 'my-kill-buffer)

(global-set-key [home]     'beginning-of-buffer)
(global-set-key [end]      'end-of-buffer)
(global-set-key [(control home)]     'beginning-of-buffer-other-window)
(global-set-key [(control end)]      'end-of-buffer-other-window)

(defvar LIMIT 1)
(defvar time 0)
(defvar mylist nil)

(defun time-now ()
   (car (cdr (current-time))))

(defun bubble-buffer ()
   (interactive)
   (if (or (> (- (time-now) time) LIMIT) (null mylist))
       (progn (setq mylist (copy-alist (buffer-list)))
          (delq (get-buffer " *Minibuf-0*") mylist)
          (delq (get-buffer " *Minibuf-1*") mylist)))
   (bury-buffer (car mylist))
   (setq mylist (cdr mylist))
   (setq newtop (car mylist))
   (switch-to-buffer (car mylist))
   (setq rest (cdr (copy-alist mylist)))
   (while rest
     (bury-buffer (car rest))
     (setq rest (cdr rest)))
   (setq time (time-now)))

(global-set-key [(control \`)] 'bubble-buffer)

(defun scroll-down-keep-cursor ()
   "Scroll the text one line down while keeping the cursor"
   (interactive)
   (scroll-down 1))

(defun scroll-up-keep-cursor ()
   "Scroll the text one line up while keeping the cursor"
   (interactive)
   (scroll-up 1))
(global-set-key [kp-divide] 'scroll-down-keep-cursor)
(global-set-key [kp-multiply] 'scroll-up-keep-cursor)

(defun scroll-other-window-down-keep-cursor ()
   "Scroll the text one line down while keeping the cursor"
   (interactive)
   (scroll-other-window-down 1))

(defun scroll-other-window-up-keep-cursor ()
   "Scroll the text one line up while keeping the cursor"
   (interactive)
   (scroll-other-window 1))
(global-set-key [(control down)] 'scroll-other-window-up-keep-cursor)
(global-set-key [(control up)] 'scroll-other-window-down-keep-cursor)

(global-set-key [(control meta down)] 'scroll-other-window)
(global-set-key [(control meta up)] 'scroll-other-window-down)
;; match parenthesis witth M-?
(global-set-key "\e?"   'match-paren)
(defun match-paren (arg)
  "Go to the matching parenthesis."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;; Completion automatique via Shift-Tab
(global-set-key (quote [S-tab]) (quote dabbrev-expand))


;-------------------------------------------------------------;
; Gestion de la roulette de la souris avec plusieurs vitesses ;
;-------------------------------------------------------------;
; control + scroll      : grande vitesse                      ;
; shift + scroll        : petite vitesse                      ;
; scroll seul           : vitesse normale                     ;
;-------------------------------------------------------------;
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)
;;

;--------------------------------------------------;
; correction orthographique : aspell               ;
;--------------------------------------------------;
; control \      : v	rifie la r	gion ou le buffer  ;
; meta \         : v	rifie une mot                 ;
; control meta \ : change de dictionnaire          ;
;--------------------------------------------------;
(defun ispell-check ()
  (interactive)
  (if mark-active
      (if (< (mark) (point))
	    (ispell-region (mark) (point))
	(ispell-region (point) (mark)))
    (ispell-buffer)))
(global-set-key [(control \\)] `ispell-check)
(global-set-key [(meta \\)] `ispell-word)
(global-set-key [(control meta \\)] `ispell-change-dictionary)
; Pour utiliser aspell au lieu de ispell d	commenter la ligne suivante
(setq ispell-program-name "aspell")
(setq ispell-local-dictionary "francais")
;;

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
        (append '(("\\.C$". c++-mode)
		  ("\\.cc$". c++-mode)
		  ("\\.hh$". c++-mode)
		  ("\\.pov$". c++-mode)
		  ("\\.inc$". c++-mode)
		  ("\\.steprc$". fvwm-mode)
		  (".letter". mail-mode)
		  (".article". mail-mode)
		  ("pico.". mail-mode)
		  (".followup". mail-mode)
		  ("rules". makefile-mode)
		  ("\\.gnus$". emacs-lisp-mode)
		  ("\\.rpm$". rpm-mode)
		  ("\\.c$". c-mode)
		  ("\\.py$". python-mode)
		  ("\\.h$". c-mode)
		  ("bashrc". shell-script-mode)
		  (".bashrc". shell-script-mode)
		  (".*zsh.*". shell-script-mode)
		  ("\\.cfg$". tex-mode)
		  ("\\.pro$". idl-mode)
		  ("\\.spec$". rpm-spec-mode)
		  ("\\.eps$". postscript-mode)
		  ("\\.m\\'". math-mode)
		  ("\\.Xdefaults$". xrdb-mode)
		  ("\\.Xenvironment$". xrdb-mode)
		  ("\\.Xresources$". xrdb-mode)
		  ("*.\\.ad$". xrdb-mode)
		  ("*.\\.s$". masd-mode)
		  ("*.\\.php$". php-mode)
		  )
		      auto-mode-alist)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 8)
 '(c-default-style "bsd")
 '(mode-line-inverse-video nil)
 '(package-selected-packages (quote (go-mode rust-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun des-knf ()
  (interactive)

  ;; Basic indent is 8 spaces
  (make-local-variable 'c-basic-offset)
  (setq c-basic-offset 8)

  ;; http://www.gnu.org/software/emacs/manual/html_node/ccmode/Brace_002fParen-Line_002dUp.html
  (c-lineup-close-paren 1)

  ;; Continuation lines are indented 4 spaces
  (make-local-variable 'c-offsets-alist)
  (c-set-offset 'arglist-cont 4)
  (c-set-offset 'arglist-cont-nonempty 4)
  (c-set-offset 'statement-cont 4)

  ;; Labels are flush to the left
  (c-set-offset 'label [0])

  ;; Fill column
  (make-local-variable 'fill-column)
  (setq fill-column 74))

(defun des-programming-keys ()
  (local-set-key "\C-m" 'newline-and-indent)
  (local-set-key [RET] 'newline-and-indent))

(defun des-c-mode-hook ()
  (des-knf)
  (des-programming-keys))

(add-hook 'c-mode-common-hook 'des-c-mode-hook)

(setq-default indent-tabs-mode nil)

;; remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; ensure there is a new line at the end of the file
(setq require-final-newline t)

;; No startup screen
(setq inhibit-startup-screen t)

;; No cursor blinking
(blink-cursor-mode 0)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "https://stable.melpa.org/packages/")
   t)
  (package-initialize))
