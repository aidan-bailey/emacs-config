(windresize-set-increment 8)

;; Macros

(fset 'frame-alternate
      "\C-xo")
(fset 'pdf-page-down
      "\C-xoj\C-xo")
(fset 'pdf-page-up
      "\C-xok\C-xo")

;; Functions

(defun 2-windows-vertical-to-horizontal ()
  (let ((buffers (mapcar 'window-buffer (window-list))))
    (when (= 2 (length buffers))
      (delete-other-windows)
      (set-window-buffer (split-window-horizontally) (cadr buffers)))))
(add-hook 'emacs-startup-hook '2-windows-vertical-to-horizontal)

(defun nin-origami-toggle-node ()
  (interactive)
  (save-excursion ;; leave point where it is
    (goto-char (point-at-eol))             ;; then go to the end of line
    (origami-toggle-node (current-buffer) (point))))                 ;; and try to fold

(defun company-idle-toggle()
  "Toggle companies complete mode delay to near infinite."
  (interactive)
  (if (= company-idle-delay 999999)
      (setq company-idle-delay 0)
    (setq company-idle-delay 999999)
    )
  )

;;(setq flycheck-inline-display-function
;;      (lambda (msg pos)
;;        (unless (eq evil-state 'insert)
;;	  (let* ((ov (quick-peek-overlay-ensure-at pos))
;;		 (contents (quick-peek-overlay-contents ov)))
;;	    (setf (quick-peek-overlay-contents ov)
;;		  (concat contents (when contents "\n") msg))
;;	    (quick-peek-update ov))))
;;      flycheck-inline-clear-function #'quick-peek-hide)

;; Space Binds

(general-def :states 'normal
  :keymaps 'override
  :prefix "SPC"

  "ESC" 'helm-keyboard-quit

  ;; Shell
  "s" 'term

  ;; Help binds
  "ha" 'helm-apropos
  ;;"hb" 'counsel-descbinds
  ;;"hF" 'counsel-describe-function
  ;;"hv" 'counsel-describe-variable
  ;;"ha" 'counsel-apropos
  ;;"hf" 'counsel-describe-face
  "hw" 'whichkey-show-major-mode

  ;; IDE Binds
  "ig"   'gdb
  "ic"    'projectile-compile-project
  "im"   'helm-make-projectile
  ;;"if"   'format-all-buffer
  "if"   'lsp-format-buffer
  "id" 'lsp-ui-doc-glance
  "it" 'lsp-ui-imenu
  ;;"if" 'lsp-format-buffer

  ;; Helm Binds
  "SPC" 'helm-M-x

  ;; Ivy Binds
  ;;"SPC" 'counsel-M-x

  ;; File Binds
  "ff" 'helm-find-files
  ;;"ff" 'counsel-find-file

  ;; Project Binds
  "pf" 'helm-projectile
  "pr" 'helm-projectile-recentf
  "pn" 'neotree-projectile-action
  ;;"pp" 'counsel-projectile
  ;;"pd" 'counsel-projectile-find-dir
  ;;"ps" 'counsel-projectile-switch-project
  ;;"pb" 'counsel-projectile-switch-to-buffer
  ;;"pc" 'helm-projectile-compile-project

  ;; Buffer Binds
  "bw" 'evil-write-all
  "bq" 'evil-quit-all
  "bd" 'kill-this-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer
  "bm" 'buffer-menu
  "bb" 'bury-buffer
  "bu" 'unbury-buffer
  "bf" 'format-all-buffer
  "bh" 'buf-move-left
  "bj" 'buf-move-down
  "bk" 'buf-move-up
  "bl" 'buf-move-right

  ;; Directory Binds
  "n" 'neotree-toggle

  ;; Folds Binds
  "TAB" 'origami-recursively-toggle-node

  ;; Tabs Binds
  "tl"  'centaur-tabs-forward
  "th"  'centaur-tabs-backward
  "td"  'centaur-tabs-do-close

  ;; Wincmd Binds
  "wh" 'evil-window-left
  "wj" 'evil-window-down
  "wk" 'evil-window-up
  "wl" 'evil-window-right
  "wH" 'buf-move-left
  "pn" 'neotree-projectile-action
  "wJ" 'buf-move-down
  "wK" 'buf-move-up
  "wL" 'buf-move-right
  "wd" 'evil-window-delete
  "wo" 'other-window
  "ws" 'split-window-vertically
  "w|" 'split-window-horizontally
  "w<" 'windresize-left
  "w>" 'windresize-right
  "w+" 'windresize-up
  "w-" 'windresize-down
  "ww" 'ace-window
  )
;; G BINDS +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(general-def
  :states 'normal
  :keymaps 'override
  :prefix "g"

  "t" 'helm-imenu
  "T" 'helm-imenu-in-all-buffers
  "s" 'helm-swoop
  "o" 'helm-occur
  "f" 'helm-find-files
  "p" 'helm-projectile-find-file
  ;;"k" 'helm-show-kill-ring
  ;;"T" 'ivy-imenu-anywhere
  ;;"t" 'counsel-imenu
  ;;"s" 'swiper
  ;;"p" 'counsel-projectile-find-file
  ;;"aw" 'evil-ace-jump-word-mode
  ;;"ac" 'evil-ace-jump-char-mode
  ;;"k" 'helm-show-kill-ring
  ;;"al" 'evil-ace-jump-line-mode

  )
;; INSERT ONLY BINDS +++++++++++++++++++++++++++++++++++++++++++++++++++++
(general-def
  :states '(insert normal)
  :keymaps 'override
  ;;"<escape>"   'keyboard-quit
  "<space>"    '(lambda () (interactive) (insert " "))
  "C-SPC"      'company-complete
  )


;; ALL BINDS +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(general-def
  :states '(insert normal visual emacs global)
  :keymaps 'override
  ;; "<mouse-4>"    'evil-previous-line
  ;; "<mouse-5>"   'evil-next-line
  )

;; COMPANY BINDS +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(general-def
  :keymaps 'company-active-map

  "SPC"   nil
  "RET"   'company-complete-selection

  )

;; MODE SPECIFIC EVIL BINDS
;; ORG BINDS +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(general-def
  :states 'normal
  :keymaps 'org-mode-map
  :prefix "g"

  "mj" 'pdf-page-down
  "mk" 'pdf-page-up
  )

(general-def
  :states 'normal
  :keymaps 'org-mode-map
  :prefix "SPC"

  "ms" 'org-download-screenshot
  )
