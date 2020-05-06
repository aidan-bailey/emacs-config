(windresize-set-increment 8)

;; Functions
(defun nin-origami-toggle-node ()
  (interactive)
  (save-excursion ;; leave point where it is
    (goto-char (point-at-eol))             ;; then go to the end of line
    (origami-toggle-node (current-buffer) (point))))                 ;; and try to fold

(defun company-idle-toggle()
  (interactive)
  "Toggle companies complete mode delay to near infinite."
  (if (= company-idle-delay 999999)
      (setq company-idle-delay 0)
    (setq company-idle-delay 999999)
    )
  )
(setq flycheck-inline-display-function
      (lambda (msg pos)
        (unless (eq evil-state 'insert)
	  (let* ((ov (quick-peek-overlay-ensure-at pos))
		 (contents (quick-peek-overlay-contents ov)))
	    (setf (quick-peek-overlay-contents ov)
		  (concat contents (when contents "\n") msg))
	    (quick-peek-update ov))))
      flycheck-inline-clear-function #'quick-peek-hide)
;; Space Binds

(general-def
  :states 'normal
  :keymaps 'override
  :prefix "SPC"

  ;; Shell
  "s" 'term

  ;; emacs Base Binds
  "ha" 'helm-apropos

  ;; Compilation Commands
  "im"   'helm-make

  ;; Helm Binds
  "SPC" 'helm-M-x
  "go"  'helm-occur
  "gk" 'helm-show-kill-ring

  ;; LSP Binds
  "ld" 'lsp-ui-doc-glance
  "lf" 'lsp-format-buffer

  ;; File Binds
  "ff" 'helm-find-files
  "fp" 'helm-projectile

  ;; Buffer Binds
  "bf" 'format-all-buffer
  "bw" 'evil-write-all
  "bq" 'evil-quit

  ;; Directory Binds
  "d" 'neotree-toggle

  ;; Folds Binds
  "TAB" 'origami-recursively-toggle-node

  ;; Tabs Binds
  "tl"  'centaur-tabs-forward
  "th"  'centaur-tabs-backward
  "tt"  'centaur-tabs-add-tab
  "td"  'centaur-tabs-do-close

  ;; Winmove
  "wH" 'windmove-left
  "wJ" 'windmove-down
  "wK" 'windmove-up
  "wL" 'windmove-right

  ;; Which Tab
  "hw" 'whichkey-show-full-major-mode

  ;; Wincmd Binds
  "wh" 'evil-window-left
  "wj" 'evil-window-down
  "wk" 'evil-window-up
  "wl" 'evil-window-right
  "wd" 'evil-window-delete
  "ws" 'split-window-vertically
  "w|" 'split-window-horizontally
  "w<" 'windresize-left
  "w>" 'windresize-right
  "w+" 'windresize-up
  "w-" 'windresize-down
  )

(general-def
  :states '(insert)
  :keymaps 'override
      ;"<escape>"   'keyboard-quit	    
      "<space>"    '(lambda () (interactive) (insert " "))
      "C-SPC"      'company-complete
      )

(general-def
  :states '(insert normal visual emacs global)
  :keymaps 'override
      "<mouse-4>"    'evil-previous-line
      "<mouse-5>"   'evil-next-line
  )
(general-def
  :keymaps 'company-active-map
      "SPC"    'nil
      "RET"   'company-complete-selection
  )
(define-key company-active-map (kbd "SPC") nil)
(define-key company-active-map (kbd "RET") #'company-complete-selection)
