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
  (append form '(:ensure t))) (advice-add #'use-package :filter-args #'use-package-always-ensure)


;; Package Packages

(use-package try)
(use-package package-utils)
(use-package no-littering)
(use-package esup)
(use-package paradox
  :config
  (paradox-enable))

;; Theme/Appearance ++++++++++++++++++++++++++++++++++++++++

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
(use-package all-the-icons)
(use-package emojify)
(use-package rainbow-delimiters)
;;(use-package linum-relative
;;  :config
;;  (add-hook 'prog-mode-hook #'linum-relative-mode))
(use-package sublimity
  :config
  (require 'sublimity-scroll)
  ;;(require 'sublimity-map)
  ;;(require 'sublimity-attractive)
  (sublimity-mode 1)
  )
(use-package highlight-indent-guides)
(use-package spaceline
  :config
  (spaceline-spacemacs-theme))
(use-package windresize)
;(use-package awesome-tab
;  :config
;  (awesome-tab-mode t))
(use-package centaur-tabs
  :config
  (centaur-tabs-headline-match)
  )
;(use-package buffer-move)

;; Hotkeys ++++++++++++++++++++++++++++++++++++++++++++++++

(use-package general)
(use-package hydra)

;; Evil Packages +++++++++++++++++++++++++++++++++++++++++++

(use-package evil)
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(use-package evil-cleverparens
  :after evil)
(use-package evil-nerd-commenter
  :after evil)
(use-package evil-org
  :after evil)
					;(use-package evil-magit)

;; Helm ++++++++++++++++++++++++++++++++++++++++++++++++++++++

(use-package helm
  :after helm-core
  )
(use-package helm-projectile
  :after projectile)
(use-package helm-descbinds)
(use-package helm-swoop)
(use-package helm-org-rifle)
(use-package helm-make)
(use-package projectile)

;; Syntax Checking +++++++++++++++++++++++++++++++++

(use-package flycheck)
;;(use-package flycheck-inline
;;  :config
;;    (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
;;(use-package flycheck-tip)
(use-package quick-peek)
(use-package format-all)

;; LSP Integration +++++++++++++++++++++++++++++++++++

(use-package lsp-mode)
(use-package lsp-ui)
(use-package lsp-treemacs)
(use-package helm-lsp
  :after lsp-mode)
(use-package csharp-mode)
(require 'lsp-csharp)

;; Version Control

;;(use-package magit)
;;(use-package forge)

;; Language Servers +++++++++++++++++++++++++++++++++++

(use-package ccls)

;; COMPANY ++++++++++++++++++++++++++++++++++++++++++++

(use-package company-quickhelp)
(use-package company-c-headers)
(use-package company-lsp
  :after lsp-mode)
(use-package yasnippet)
(use-package auto-yasnippet
  :after yasnippet)
(use-package company-box)

;; Debugging ++++++++++++++++++++++++++++++++++++++++++

(use-package dap-mode)
;(use-package realgud)

;; ORG MODE +++++++++++++++++++++++++++++++++++++++++++++++++

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(use-package org-download)

;; NAVIGATION +++++++++++++++++++++++++++++++++++++++++++++++

;;(use-package neotree)
(use-package treemacs)
(use-package treemacs-evil)
(use-package project-explorer)
(use-package switch-window)
(use-package ace-jump-mode)
(use-package ace-link
  :config
  (ace-link-setup-default))

;; Misc Tools ++++++++++++++++++++++++++++++++++++++++++++++++

(use-package undo-tree)
(use-package smartparens)

;; Help Packages +++++++++++++++++++++++++++++++++++++++++++++

(use-package powerthesaurus)
(use-package imenu-anywhere)
(use-package pdf-tools
  :config
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode)))
(use-package helpful)
(use-package which-key)
(use-package cheatsheet)
(use-package origami
  :config
  (add-hook 'prog-mode-hook
	    (lambda ()
	      (setq-local origami-fold-style 'triple-braces)
	      (origami-mode)
	      (origami-close-all-nodes (current-buffer)))))
