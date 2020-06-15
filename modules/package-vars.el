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
(setq lsp-lens-auto-enable nil)
(setq lsp-pyls-plugins-flake8-enabled t)
(setq lsp-pyls-plugins-pycodestyle-enabled nil)
(setq lsp-pyls-plugins-pyflakes-enabled nil)
;;(setq lsp-csharp-server-path "/home/aidanjbailey/.emacs.d/extras/language-servers/omnisharp-roslyn")

;; Org-Download
(setq org-download-screenshot-method "spectacle -br -o %s")

;; Helm
;;(setq helm-autoresize-max-height 0)
;;(setq helm-autoresize-min-height 20)

;; Ivy
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

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

;; Sublimity
(setq sublimity-scroll-weight 1
      sublimity-scroll-drift-length 0)

;; Evil
(setq evil-want-integration t)

;; Highlight-Indent-Guides
(setq highlight-indent-guides-method 'character)

;; LSP-UI
(setq lsp-peek-enable t)

;; CCLS
(setq ccls-executable "/usr/bin/ccls")
