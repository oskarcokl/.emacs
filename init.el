;; ===============================================================
;; Emacs Configuration for Development (macOS)
;; Progress: Evil + Doom Theme + Modern Completion + Projectile
;; ===============================================================


;; -----------------
;; Environemnt setup
;; -----------------
;;
;; NOTE(oskar): Add typescript ls to exec path, I'm pretty sure this is a mac only issue.
(add-to-list 'exec-path "/Users/iprom/.nvm/versions/node/v22.13.0/bin/")

;; -----------------------------
;; Basic package initialization
;; -----------------------------
(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; -----------------------------
;; Bootstrap use-package
;; -----------------------------
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; -----------------------------
;; Vim keybindings: Evil + Evil Collection
;; -----------------------------
(use-package evil
  :init
  (setq evil-want-keybinding nil
        evil-want-integration t
        evil-want-C-u-scroll t
        evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (message "Evil mode loaded successfully!"))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  (message "Evil Collection initialized."))

;; -----------------------------
;; Usability & Appearance
;; -----------------------------
(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

(use-package doom-themes
:config
(load-theme 'doom-sourcerer t))


(use-package all-the-icons
  :if (display-graphic-p))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0d2c5679b6d087686dcfd4d7e57ed8e8aedcccc7f1a478cd69704c02e4ee36fe"
     "f1e8339b04aef8f145dd4782d03499d9d716fdc0361319411ac2efc603249326"
     "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19"
     "720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93"
     "7e98dc1aa7f5db0557691da690c38d55e83ddd33c6d268205d66e430d57fb982"
     default))
 '(indent-tabs-mode nil)
 '(package-selected-packages
   '(all-the-icons apheleia consult-projectile diff-hl doom-themes
                   evil-collection marginalia modus-themes orderless
                   vertico vterm-toggle)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Use command for the modifier key instead of option.
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)


;; Set default font "height"
(set-face-attribute 'default nil :height 180 :family "Fira Code")

(diff-hl-mode)

;; List of tree sitter grammers
(setq treesit-language-source-alist
  '((tsx "https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "tsx/src")
    (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "typescript/src")
    (css-in-js "https://github.com/orzechowskid/tree-sitter-css-in-js" "lates" "src")))


;; Automatically load tsx-ts-mode when entering a .tsx file.
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(setq typescript-ts-mode-indent-offset 4)
;; Start eglot automatically when tsx-ts-mode is called
(add-hook 'tsx-ts-mode-hook 'eglot-ensure)

(add-to-list 'custom-theme-load-path '"/Users/iprom/.emacs.d/themes/")

;; Hide tool-bar
(tool-bar-mode -1)
(scroll-bar-mode -1)
