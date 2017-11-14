(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
      package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(package-initialize)

(setq evil-want-C-u-scroll t)
(setq evil-search-module 'evil-search)
(require 'evil)
(evil-mode 1)

;(require 'highlight)
;(require 'evil-search-highlight-persist)
;(global-evil-search-highlight-persist t)

(require 'evil-visualstar)
(global-evil-visualstar-mode t)

(modify-syntax-entry ?_ "w")

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;(global-set-key [escape] (lambda () (interactive) ('evil-exit-emacs-state) ('evil-search-highlight-persist-remove-all)))


(global-linum-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (company racer rust-mode yaml-mode which-key web-mode terraform-mode neotree multi-term minimap markdown-mode less-css-mode json-mode js2-mode highlight goto-last-change git-gutter evil-visualstar evil-org evil-magit dtrt-indent diff-hl)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
 ;; start maximized


(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-directory "~/Sync/org")
(setq org-agenda-files '("~/Sync/org"))
(setq org-startup-indented t)

(setq org-todo-keywords
      '((sequence "TODO" "WAIT" "DONE"))
      )
(setq org-todo-keyword-faces
      '(("WAIT" . "orange"))
      )

(add-to-list 'load-path "/directory/containing/neotree/")
(require 'neotree)
(setq neo-smart-open t)
(global-set-key [f4] 'neotree-toggle)
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
	    (define-key evil-normal-state-local-map (kbd "a") 'neotree-create-node)
	    (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
	    (define-key evil-normal-state-local-map (kbd "r") 'neotree-refresh)
	    (define-key evil-normal-state-local-map (kbd "h") 'neotree-hidden-file-toggle)
	    (define-key evil-normal-state-local-map (kbd "C") 'neotree-change-root)
	    (define-key evil-normal-state-local-map (kbd "i") 'neotree-enter-horizontal-split)
	    (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
	    (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

; use Alt+direction_keys to move cursor around split panes
(windmove-default-keybindings 'meta)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-down)

(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/autosaves" t)))



(progn(require 'comint)
(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
(define-key comint-mode-map (kbd "<down>") 'comint-next-input))

(global-set-key [f6] 'toggle-truncate-lines)

;(setq evil-magit-state 'motion)
;(require 'evil-magit)
(global-set-key (kbd "C-x g") 'magit-status)

(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;Arch packages
(add-to-list 'auto-mode-alist '("\\PKGBUILD\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.install\\'" . sh-mode))

;(require 'git-gutter)
;(global-git-gutter-mode t)
;(git-gutter:linum-setup)

;(require 'diff-hl-mode)
(global-diff-hl-mode 1)
(diff-hl-flydiff-mode)

;(modify-syntax-entry ?_ "w")
(add-hook 'ruby-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))

;; (with-eval-after-load 'evil
;;     (defalias #'forward-evil-word #'forward-evil-symbol))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(global-visual-line-mode t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;rust
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
