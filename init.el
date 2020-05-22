;; Base Configurations
(let ((default-directory  "~/.emacs.d/extras"))
  (normal-top-level-add-subdirs-to-load-path))

;; Load Theme
(load-file "~/.emacs.d/extras/themes/afterglow-theme.el")
;; Load Base Configurations
(load-file "~/.emacs.d/base-config.el")
;; Load Packages
(load-file "~/.emacs.d/package-list.el")
;; load Keymap
(load-file "~/.emacs.d/general-spacemap.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(centaur-tabs-gray-out-icons (quote buffer))
 '(centaur-tabs-plain-icons t)
 '(centaur-tabs-set-modified-marker t)
 '(company-auto-complete nil)
 '(company-auto-complete-chars (quote (32 95 40 41 119 46 39)))
 '(company-box-icons-alist (quote company-box-icons-images))
 '(company-box-show-single-candidate t)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(company-require-match nil)
 '(company-tooltip-limit 6)
 '(company-tooltip-margin 2)
 '(flycheck-display-errors-delay 0)
 '(flycheck-tip-avoid-show-func nil)
 '(inhibit-startup-screen t)
 '(lsp-auto-guess-root nil)
 '(lsp-enable-snippet t)
 '(lsp-lens-auto-enable nil)
 '(lsp-pyls-plugins-flake8-enabled t)
 '(lsp-pyls-plugins-pycodestyle-enabled nil)
 '(lsp-pyls-plugins-pyflakes-enabled nil)
 '(lsp-ui-doc-delay 0.9)
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-doc-header t)
 '(lsp-ui-doc-use-webkit t)
 '(lsp-ui-flycheck-list-position (quote bottom))
 '(lsp-ui-imenu-kind-position (quote left))
 '(lsp-ui-sideline-delay 0)
 '(lsp-ui-sideline-enable t)
 '(lsp-ui-sideline-show-diagnostics t)
 '(lsp-ui-sideline-show-hover t)
 '(org-download-screenshot-method "spectacle -br -o %s")
 '(package-selected-packages
   (quote
    (transient git-commit evil magit company evil-magit company-c-headers use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(centaur-tabs-selected ((t (:background "gray18" :foreground "dark orange" :overline "dark orange" :underline nil))))
 '(centaur-tabs-selected-modified ((t (:background "gray18" :foreground "dark orange" :overline "dark orange" :underline nil))))
 '(company-box-annotation ((t (:foreground "dark orange"))))
 '(company-tooltip ((t (:background "#666666" :foreground "black" :weight bold))))
 '(flycheck-error ((t (:underline "Red1"))))
 '(lsp-ui-doc-background ((t (:background "dim gray"))))
 '(lsp-ui-doc-header ((t (:background "#232323" :foreground "dark orange"))))
 '(lsp-ui-peek-peek ((t (:background "#3d3c3d"))))
 '(lsp-ui-sideline-symbol ((t (:foreground "grey" :box (:line-width -1 :color "dark orange") :height 0.99))))
 '(neo-dir-link-face ((t (:foreground "DarkOrange"))))
 '(neo-root-dir-face ((t (:foreground "dim gray" :weight bold))))
 '(org-level-1 ((t (:foreground "deep sky blue" :slant italic :weight semi-bold :height 1.3))))
 '(org-level-2 ((t (:foreground "cyan" :slant italic :weight semi-bold :height 1.2))))
 '(org-level-3 ((t (:foreground "dark turquoise" :slant italic :weight bold :height 1.1))))
 '(org-level-4 ((t (:foreground "dark cyan" :slant italic :weight bold :height 1.1))))
 '(org-level-5 ((t (:slant italic :weight semi-bold))))
 '(org-level-6 ((t (:inherit outline-6 :slant italic :weight semi-bold))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "medium purple"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "red")))))

;; FlyCheck Bitmap
(define-fringe-bitmap 'flycheck-fringe-bitmap-ball
  (vector #b01100000
	  #b00110000
	  #b00011000
	  #b10001100
	  #b11000110
	  #b01100011
	  #b01100011
	  #b11000110
	  #b10001100
	  #b00011000
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
  :severity 50
  :compilation-level 1
  :overlay-category 'flycheck-warning-overlay
  :fringe-bitmap 'flycheck-fringe-bitmap-ball
  :fringe-face 'flycheck-fringe-warning
  :error-list-face 'flycheck-warning-list-error)

