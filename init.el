;; Minimal UI
;; From https://dev.to/huytd/emacs-from-scratch-1cg6
;(scroll-bar-mode -1)  - I like have scroll bars
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; Emacs by default will pester you with a splash screen and a message in the echo area. To disable both, and have emacs default to its *scratch* buffer,
;; From https://www.masteringemacs.org/article/beginners-guide-to-emacs
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t) 

;; Package configs
;; From https://dev.to/huytd/emacs-from-scratch-1cg6
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
;			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Theme
;; From https://dev.to/huytd/emacs-from-scratch-1cg6
(use-package doom-themes
  :ensure t
  :init
  (load-theme 'doom-one t)
  :config
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; which key - https://github.com/justbur/emacs-which-key
;; From https://sam217pa.github.io/2016/08/30/how-to-make-your-own-spacemacs/
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05)
  :diminish which-key-mode)

;; ivy-mode ensures that any Emacs command using completing-read-function
;; uses ivy for completion.
;; Counsel takes this further, providing versions of common Emacs commands
;; that are customised to make the best use of ivy.
;; From https://sam217pa.github.io/2016/08/30/how-to-make-your-own-spacemacs/
(use-package ivy :ensure t
  :diminish (ivy-mode . "") ; does not display ivy in the modeline
  :init (ivy-mode 1)        ; enable ivy globally at startup
  :bind (:map ivy-mode-map  ; bind in the ivy buffer
	      ("C-'" . ivy-avy)) ; C-' to ivy-avy
  :config
  (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
  (setq ivy-height 20)               ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ") ; count format, from the ivy help page
  )

(use-package counsel :ensure t
  :bind*                           ; load counsel when pressed
  (("M-x"     . counsel-M-x)       ; M-x use counsel
   ("C-x C-f" . counsel-find-file) ; C-x C-f use counsel-find-file
   ("C-x C-r" . counsel-recentf)   ; search recently edited files
   ("C-c f"   . counsel-git)       ; search for files in git repo
   ("C-c s"   . counsel-git-grep)  ; search for regexp in git repo
   ("C-c /"   . counsel-ag)        ; search for regexp in git repo using ag
   ("C-c l"   . counsel-locate))   ; search for files or else using locate
  )

;; CIDER for clojure development https://cider.readthedocs.io/en/latest/
;; Use the stable version of CIDER
(use-package cider
  :ensure t
;  :pin melpa-stable
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (cider which-key use-package doom-themes counsel))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
