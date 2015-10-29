;;
;;  emacs startup file
;;
;; Michael Turmon
;;

(setq load-path
      (append (list (expand-file-name "~/.emacs.d")
		    )
	      load-path))
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) (cons '("\\.py$" . python-mode) auto-mode-alist)))
(require 'jsd-mode)
(setq auto-mode-alist (cons '("\\.jsd$" . jsd-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) (cons '("matlab" . matlab-mode) interpreter-mode-alist)))
(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(autoload 'python-mode "python-mode" "Python editing mode." t)
(require 'color-theme-solarized)
(server-start)

;; VARIABLE SETTINGS
(defvar on-macintosh (not (getenv "TERM"))) ; this kludge once worked
(defun do-nothing () "Do nothing at all " (interactive) nil)
(defun expand-directory-name (arg)
  (directory-file-name (expand-file-name arg)))
(global-font-lock-mode t)
(setq minibuffer-max-depth nil)
(setq-default fill-column 75)
(setq checkpoint-frequency 600)
(setq unlink-checkpoint-files 1)
(setq quick-redisplay 1)
(setq track-eol-on-^N-^P 1)
(setq ctlchar-with-^ t)
(setq silently-kill-processes t)
(setq make-backup-files nil)   ;; no tilde files of any sort
(setq default-major-mode 'text-mode)
;(setq TeX-default-mode 'LaTeX-mode) ;; probably out of date
(setq inhibit-startup-message t)
(setq auto-save-interval 250)
(setq auto-save-default t)
(setq blink-matching-paren 500)
(setq scroll-step 4)
(setq display-time-day-and-date t)
(put 'narrow-to-region 'disabled nil)
(put 'set-fill-column 'disabled t)
(put 'eval-expression 'disabled nil)
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;
(display-time)

;;
;; REDEFINE SOME KEYS
;;
;;; These are for convenience
;; try default (define-key ctl-x-map "\^b" 'electric-buffer-list) 
(define-key ctl-x-map "!" 'shell)
(define-key ctl-x-map "`" 'next-error)
(define-key esc-map "r" 'revert-buffer)
(define-key esc-map "g" 'goto-line)
(define-key esc-map "=" 'what-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Following lines up to "end" comment are from:
;;; .emacs file, Enrico Franconi,  franconi@inf.unibz.it
;;; Time-stamp: <2003-12-15 16:02:36 franconi> 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Do not customize the following parameters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun load-local-site-start (site-lisp-directory )
  "Load site-start.el from a given site-lisp directory"
  (let ((current-default-directory default-directory))
    (setq default-directory site-lisp-directory)
    (normal-top-level-add-subdirs-to-load-path)
    (setq default-directory current-default-directory)
    (setq load-path (cons site-lisp-directory load-path))
    (load (concat site-lisp-directory "/site-start.el"))
    ))

;; Allow any emacs to load site-lisp files
;(unless (boundp 'darwinp)
;  (load-local-site-start 
;   "/Applications/Emacs.app/Contents/Resources/site-lisp")
;  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Customize LaTeX parameters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Directories containing the sites TeX macro files and style files
(setq TeX-macro-global '("/usr/local/teTeX/share/texmf/tex/"
			 "/usr/local/teTeX/share/texmf.os/tex/"
			 "/usr/local/teTeX/share/texmf.local/tex/"
			 "~/Library/tex/Inputs/Personal"))

;; this definition should be done in a site-dependent way
(setq darwinp t)

;; A4 not default paper
(setq TeX-a4-paper nil)

;; List of available printers
(setq TeX-printer-list '(("franklin")
			 ("franconi-printer")))

;; Preferred view format: dvi, ps, pdf, pdfs
(setq TeX-view-format "pdfs")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Customize window parameters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (when (and (boundp carbon-emacsp) carbon-emacsp)
;;   ;; courier 14 font and 54x80 window dimension
;;   (setq default-frame-alist '((width . 80) 
;; 			      (height . 48)
;; 			      (font . "fontset-courier")))
;;   (setq initial-frame-alist default-frame-alist)
;;   )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; End
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
