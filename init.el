(setq find-file-visit-truename t)
(menu-bar-mode 0)

(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'scala-mode-auto)
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
;(require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)
(setq column-number-mode t)
;(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

(setq-default indent-tabs-mode nil)	; use spaces instead of tabs

(put 'eval-expression 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun numseq(start end &optional inc)
  "Output a sequence of integers from start to end using an option increment"
  (interactive "nStart: \nnEnd: ")
  (setq inc (if inc inc 1))
  (while (<= start end)
    (princ start (current-buffer))(terpri (current-buffer))
    (setq start (+ start inc))))

(defun my-buffer-menu (arg)
  "use the default buffer menu, but put exit commands in the right place"
  (interactive "P")
  (list-buffers arg)				; insert names
  (pop-to-buffer "*Buffer List*"))		; select that buffer

(defun scroll-down-1 ()
  "Scroll down 1 line."
  (interactive)
  (scroll-down 1))

(defun scroll-up-1 ()
  "Scroll up 1 line."
  (interactive)
  (scroll-up 1))

(define-key ctl-x-map "\C-b" 'my-buffer-menu)	; C-x C-b buffer menu
(define-key esc-map "g" 'goto-line)		; M-g goto specific line
(define-key esc-map "n" 'scroll-up-1)
(define-key esc-map "p" 'scroll-down-1)
(global-set-key (kbd "C-S-N") 'scroll-up-1)
(global-set-key (kbd "C-S-P") 'scroll-down-1)
(global-set-key (kbd "C-X #") 'linum-mode)

;; -- JS Mode configuration --
(load "defuns-config.el")
(load "js-config.el")
(add-to-list 'load-path "~/.emacs.d/elisp/jade-mode") ;; github.com/brianc/jade-mode
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.g4$" . antlr-mode))
(add-to-list 'auto-mode-alist '("\\.xsd$" . xml-mode))

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
