(defun company-idle-toggle()
  "Toggle companies complete mode delay to near infinite."
  (interactive)
  (if (= company-idle-delay 999999)
      (setq company-idle-delay 0)
    (setq company-idle-delay 999999)
    )
  )

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
;(add-hook 'emacs-startup-hook 'helm-descbinds-mode)
(add-hook 'emacs-startup-hook 'projectile-mode)
(add-hook 'emacs-startup-hook 'lsp-treemacs-sync-mode)
(add-hook 'emacs-startup-hook 'yas-global-mode)
(add-hook 'emacs-startup-hook 'which-key-mode)
(add-hook 'emacs-startup-hook 'helm-autoresize-mode)
(add-hook 'emacs-startup-hook 'electric-pair-mode)
(add-hook 'emacs-startup-hook 'ivy-mode)

;; Prog-Mode-Hook
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;;(add-hook 'prog-mode-hook 'smartparens-mode)

;; Company-Mode-Hook
(add-hook 'company-mode-hook 'company-quickhelp-mode)
(add-hook 'company-mode-hook 'company-box-mode)

;; Yasnippet

;; Org-Mode-Hook
(add-hook 'org-mode-hook 'org-bullets-mode )

;; Dired-Mode-Hook
(add-hook 'dired-mode-hook 'org-download-enable)

;; LSP-Mode
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'java-mode-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)
(add-hook 'csharp-mode-hook 'lsp)

;; Company Backends
(add-to-list 'company-backend 'company-c-headers)
(add-to-list 'company-backends 'company-lsp)

;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

(defun company-yasnippet-or-completion ()
  (interactive)
  (let ((yas-fallback-behavior nil))
    (unless (yas-expand)
      (call-interactively #'company-complete-common))))

(add-hook 'company-mode-hook (lambda ()
  (substitute-key-definition 'company-complete-common
                             'company-yasnippet-or-completion
                             company-active-map)))
