;; Base Configurations
(global-hl-line-mode +1)
(display-time)
(blink-cursor-mode 0)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode '(16 . 0))
(add-hook 'prog-mode-hook #'company-mode)
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))
(setq display-time-day-and-date t)
(load-theme 'afterglow t)
(set-face-attribute 'fringe nil :background "#2e2e2e" :foreground "#2e2e2e")

;; Set default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 110
                    :weight 'normal
                    :width 'normal)

;; Prepare Melpa library
(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Sets up use-package for easy package installation
(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;; Package Declaration
(defun use-package-always-ensure (form)
  (append form '(:ensure t)))
(advice-add #'use-package :filter-args #'use-package-always-ensure)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package flycheck
  :after evil
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode))
(use-package windresize)
(use-package ccls
  :init
  (setq ccls-executable "/usr/bin/ccls"))
(use-package paradox )
(use-package esup)
(use-package no-littering)
(use-package package-utils)
(use-package try)
(use-package all-the-icons)
(use-package emojify)
(use-package undo-tree)
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
(use-package linum-relative
  :config
  (linum-on)
  (linum-relative-global-mode))
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(use-package evil-cleverparens)
(use-package general)
(use-package hydra)
(use-package helm
  :after helm-core)
(use-package helm-projectile)
(use-package centaur-tabs
  :init
  (setq centaur-tabs-set-bar 'over)
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-icons t)
  :config
  (centaur-tabs-mode)
  (centaur-tabs-headline-match)
  )
;;; COMPLETION AND LSP
(use-package lsp-mode
  :init
  (setq lsp-enable-snippet t))
  :config
  (add-hook 'prog-mode-hook #'lsp)
(use-package lsp-ui
  :init
  (setq lsp-ui-doc-enable nil))
(use-package company-quickhelp
  :config
  (company-quickhelp-mode))
(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers))
(use-package company-lsp
:config
(add-to-list 'company-backends #'company-backends))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
(use-package sublimity
  :config
  (sublimity-mode 1)
  )
(use-package helpful)
(use-package helm-descbinds
  :config
  (helm-descbinds-mode))
(use-package which-key
  :config
  (which-key-mode))
(use-package cheatsheet)
(use-package origami :ensure t
  :config
  (add-hook 'prog-mode-hook
	    (lambda ()
	      (setq-local origami-fold-style 'triple-braces)
	      (origami-mode)
	      (origami-close-all-nodes (current-buffer)))))
(use-package ace-jump-mode)
(use-package helm-swoop)
(use-package imenu-anywhere)
(use-package switch-window)
(use-package ace-link
  :config
  (ace-link-setup-default))
(use-package projectile
  :config
  (projectile-mode +1))
(use-package project-explorer)
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(use-package helm-org-rifle)
(use-package org-download
  :config
  (add-hook 'dired-mode-hook 'org-download-enable))
(use-package neotree)
(use-package yasnippet
  :config
  (yas-global-mode 1))
(use-package auto-yasnippet)
(use-package evil-nerd-commenter)
(use-package smartparens
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode))

(use-package format-all)
(use-package helm-make)
(use-package helm-lsp)
					;(use-package company-tabnine
					;  :config
					;    (add-to-list 'company-backends #'company-tabnine))
(use-package flx)
(use-package realgud)
(use-package magit)
(use-package forge)
(use-package pdf-tools)
(use-package spaceline
  :config
  (spaceline-spacemacs-theme))
(use-package powerthesaurus)
(use-package quick-peek)
(use-package flycheck-inline)
;  :config
;  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
;; Keymaps
(global-set-key (kbd "<wheel-up>") 'evil-scroll-line-up)
(global-set-key (kbd "<wheel-down>") 'evil-scroll-line-down)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(centaur-tabs-plain-icons t)
 '(centaur-tabs-set-modified-marker t)
 '(company-auto-complete nil)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(company-tooltip-limit 5)
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (company-c-headers use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(centaur-tabs-selected ((t (:background "gray18" :foreground "dark orange" :overline "dark orange" :underline nil))))
 '(centaur-tabs-selected-modified ((t (:background "gray18" :foreground "dark orange" :overline "dark orange" :underline nil))))
 '(company-tooltip ((t (:background "#666666" :foreground "black" :weight bold)))))

;; FlyCheck Bitmap
(define-fringe-bitmap 'flycheck-fringe-bitmap-ball
  (vector #b01100000
	  #b00110000
	  #b10011000
	  #b01001100
	  #b10100110
	  #b01010011
	  #b01010011
	  #b10100110
	  #b01001100
	  #b10011000
	  #b00110000
	  #b01100000))

(flycheck-define-error-level 'error
  :severity 100
  :compilation-level 2
  :overlay-category 'flycheck-error-overlay
  :fringe-bitmap 'flycheck-fringe-bitmap-ball
  :fringe-face 'flycheck-fringe-error
  :error-list-face 'flycheck-error-list-error)
(flycheck-define-error-level 'warning
  :severity 100
  :compilation-level 2
  :overlay-category 'flycheck-error-overlay
  :fringe-bitmap 'flycheck-fringe-bitmap-ball
  :fringe-face 'flycheck-fringe-error
  :error-list-face 'flycheck-error-list-error)

(load-file "~/.emacs.d/general-spacemap.el")
