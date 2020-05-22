;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HOOKS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  _   _             _         ;;;;
;;;; | | | |           | |        ;;;;
;;;; | |_| | ___   ___ | | _____  ;;;;
;;;; |  _  |/ _ \ / _ \| |/ / __| ;;;;
;;;; | | | | (_) | (_) |   <\__ \ ;;;;
;;;; \_| |_/\___/ \___/|_|\_\___/ ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacs-Startup-Hook
(add-hook 'emacs-startup-hook 'evil-mode)
(add-hook 'emacs-startup-hook 'centaur-tabs-mode)
(add-hook 'emacs-startup-hook 'helm-descbinds-mode)
(add-hook 'emacs-startup-hook 'projectile-mode)
(add-hook 'emacs-startup-hook 'lsp-treemacs-sync-mode)
(add-hook 'emacs-startup-hook 'yas-global-mode)
(add-hook 'emacs-startup-hook 'which-key-mode)

;; Prog-Mode-Hook
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;;(add-hook 'prog-mode-hook 'smartparens-mode)

;; Company-Mode-Hook
(add-hook 'company-mode-hook 'company-quickhelp-mode)
(add-hook 'company-mode-hook 'company-box-mode)

;; Org-Mode-Hook
(add-hook 'org-mode-hook 'org-bullets-mode )

;; Dired-Mode-Hook
(add-hook 'dired-mode-hook 'org-download-enable)

;; LSP-Mode
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'java-mode-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)

;; Company Backends
(add-to-list 'company-backend 'company-c-headers)
(add-to-list 'company-backends 'company-lsp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; VARIABLES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  _   _            _       _     _            ;;;;
;;;; | | | |          (_)     | |   | |           ;;;;
;;;; | | | | __ _ _ __ _  __ _| |__ | | ___  ___  ;;;;
;;;; | | | |/ _` | '__| |/ _` | '_ \| |/ _ \/ __| ;;;;
;;;; \ \_/ / (_| | |  | | (_| | |_) | |  __/\__ \ ;;;;
;;;;  \___/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/ ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Centaur-Tabs
(setq centaur-tabs-gray-out-icons (quote buffer))
(setq centaur-tabs-set-bar 'over)
(setq centaur-tabs-style "bar")
(setq centaur-tabs-gray-out-icons 'buffer)
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-plain-icons t)
(setq centaur-tabs-set-modified-marker t)

;; Flycheck
(setq flycheck-display-errors-delay 0)
(setq flycheck-tip-avoid-show-func nil)

;; LSP-Mode
(setq lsp-enable-snippet t)
(setq lsp-auto-guess-root nil)
(setq lsp-enable-snippet t)
(setq lsp-lens-auto-enable nil)
(setq lsp-pyls-plugins-flake8-enabled t)
(setq lsp-pyls-plugins-pycodestyle-enabled nil)
(setq lsp-pyls-plugins-pyflakes-enabled nil)

;; Org-Download
(setq org-download-screenshot-method "spectacle -br -o %s")

;; LSP-Ui
(setq lsp-ui-doc-delay 0.9)
(setq lsp-ui-doc-enable nil)
(setq lsp-ui-doc-header t)
(setq lsp-ui-doc-use-webkit t)
(setq lsp-ui-flycheck-list-position (quote bottom))
(setq lsp-ui-imenu-kind-position (quote left))
(setq lsp-ui-sideline-delay 0)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-show-hover t)

;; Company
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-require-match nil)
(setq company-tooltip-limit 6)
(setq company-tooltip-margin 2)
(setq company-auto-complete nil)
(setq company-auto-complete-chars (quote (32 95 40 41 119 46 39)))

;; Company-Box
(setq company-box-icons-alist (quote company-box-icons-images))
(setq company-box-show-single-candidate t)

;; Evil
(setq evil-want-integration t)

;; Highlight-Indent-Guides
(setq highlight-indent-guides-method 'character)

;; LSP-UI
(setq lsp-peek-enable t)

;; CCLS
(setq ccls-executable "/usr/bin/ccls")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; FACES ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  _____                   ;;;;
;;;; |  ___|                  ;;;;
;;;; | |_ __ _  ___ ___  ___  ;;;;
;;;; |  _/ _` |/ __/ _ \/ __| ;;;;
;;;; | || (_| | (_|  __/\__ \ ;;;;
;;;; \_| \__,_|\___\___||___/ ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

