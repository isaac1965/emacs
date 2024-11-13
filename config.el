;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Aplicar un tema personalizado
(setq doom-theme 'doom-gruvbox)
(setq select-enable-clipboard t)
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 15))
(use-package evil
  :ensure t
  :config
  (define-key evil-insert-state-map (kbd "jj") 'evil-normal-state))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation). - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys



(map! :leader
      :desc "Split Window vertically" "s v" #'split-window-right
      :desc "Split Window horizontally" "s h" #'split-window-below)

(map! :leader
      :desc "Pegar desde el portapeles" "p" #'clipboard-yank)

(map! :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right)
;; Mapeo de teclas para redimensionar paneles
(map! :leader
      :desc "Aumentar ancho" "l" #'evil-window-increase-width
      :desc "Disminuir ancho" "h" #'evil-window-decrease-width
      :desc "Aumentar altura" "j" #'evil-window-increase-height
      :desc "Disminuir altura" "k" #'evil-window-decrease-height)

(map! :leader "q" #'save-buffers-kill-terminal)


(map! :leader "t" #'vterm)

;; Mapeo de teclas para abrir NeoTree
(map! :leader "e" #'neotree-toggle)  ;; Cambia "n n" por el atajo que prefieras

(map! :leader "c c" #'comment-line)

;; Buffers
(map! :leader
      :desc "Siguiente buffer" "b n" #'next-buffer
      :desc "Buffer anterior" "b p" #'previous-buffer)
(map! :leader :desc "Close buffer" "x" #'kill-this-buffer)

(map! :leader
      "f f" #'find-file)

(map! :leader
      "f b" #'switch-to-buffer)

;; Mapeo de teclas para abrir Dired
(map! :leader
      :desc "Abrir Dired" "d" #'dired)


;; Emmet
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

(setq confirm-kill-emacs nil)

;; (after! emmet
  ;; (define-key emmet-mode-map (kbd "M-g M-e") #'emmet-expand-line))


;; Easymotion

;; (map! :leader
      ;; "s" #'evilem-motion-find-char)



;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
