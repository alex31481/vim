(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; initialize package
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.  Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
         (package-install package)
         package))
   packages))
;; initialize package
; (defun ensure-package-installed (&rest packages)
;   "Assure every package is installed, ask for installation if it’s not.  Return a list of installed packages or nil for every skipped package."
;   (mapcar
;    (lambda (package)
;      (if (package-installed-p package)
;          nil
;        (if (y-or-n-p (format "Package %s is missing. Install it? " package))
;            (package-install package)
;          package)))
;    packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'flx-ido 
                          'evil 
                          'helm 
                          'helm-projectile 
                          'helm-ag
                          'projectile 
                          'magit 
                          'key-chord 
                          'ample-theme 
                          'linum-relative
                          'evil-leader
                          'evil-search-highlight-persist
                          'ace-jump-mode
                          'company
                          'smooth-scroll
                          'diminish
                          'powerline-evil
                          'flycheck
                          'web-mode
                          'js2-mode
                          'json-mode
                          'exec-path-from-shell
                          'tern
                          'tern-auto-complete
                          ;'company-tern
                          ;'evil-tabs
                          )


;; "after" macro definition
(if (fboundp 'with-eval-after-load)
    (defmacro after (feature &rest; body)
      "After FEATURE is loaded, evaluate BODY."
      (declare (indent defun))
      `(with-eval-after-load ,feature ,@body))
  (defmacro after (feature &rest; body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))))

;;;;;;;;; load vim first;;;;;;;;;
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(require 'evil)
(evil-mode t)
;;don't need
;;(global-evil-tabs-mode t)

;; load themes
(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
;; pick ample flat
(enable-theme 'ample)

(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)

(evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)

(setq ace-jump-word-mode-use-query-char nil)
(evil-leader/set-key "e" 'evil-ace-jump-word-mode) ; ,e for Ace Jump (word)
(evil-leader/set-key "l" 'evil-ace-jump-line-mode) ; ,l for Ace Jump (line)
(evil-leader/set-key "x" 'evil-ace-jump-char-mode) ; ,x for Ace Jump (char)

(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

;;;;;;; flx ido;;;;;;;;;;;;;;
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;;;;;;;;;;;;;projectile;;;;;;;;;;;;;;;
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)

;;;;;;;;;;helm;;;;;;;;;;;;;;;;;;;;;
;; (setq helm-projectile-fuzzy-match nil)
;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(helm-projectile-on)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)

(global-set-key (kbd "M-x") 'helm-M-x)

(defun helm-my-buffers ()
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
  (helm-other-buffer '(helm-c-source-buffers-list
                       ;helm-c-source-elscreen
                       helm-c-source-projectile-files-list
                       helm-c-source-ctags
                       helm-c-source-recentf
                       helm-c-source-locate)
                     "*helm-my-buffers*")))







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; vim stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; relatie-number
(linum-mode t)
(linum-on)
;;(linum-relative-enable-helm-support t)
(linum-relative-mode)
;; normal key maps

(require 'key-chord)
(key-chord-mode 1)
;;jk normal mode 
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
;; ; to : for convinience
(define-key evil-normal-state-map ";" 'evil-ex)
;; C-s to save
(define-key evil-insert-state-map (kbd "C-s")(lambda () (interactive) (evil-normal-state) (save-buffer)))
;; double space to envoke search
(key-chord-define evil-normal-state-map "  " 'helm-mini)

;; no bell
(setq visible-bell 1)

(add-hook 'after-init-hook 'global-company-mode)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)


;;hide toold bar
(tool-bar-mode -1)


;; wraped line navigation
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; indent with spaces only
(setq-default tab-width 2 indent-tabs-mode nil)

;; matching parentices
(show-paren-mode t)

;; no backup files
(setq make-backup-files nil)

;; save cursor positions
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; no scroll bar
(scroll-bar-mode -1)

;; power line
(require 'powerline)
(powerline-default-theme)


;; clean bar
(require 'diminish)
(diminish 'visual-line-mode)
; (after 'autopair (diminish 'autopair-mode))
; (after 'undo-tree (diminish 'undo-tree-mode))
; (after 'auto-complete (diminish 'auto-complete-mode))
; (after 'projectile (diminish 'projectile-mode))
; (after 'yasnippet (diminish 'yas-minor-mode))
; (after 'guide-key (diminish 'guide-key-mode))
; (after 'eldoc (diminish 'eldoc-mode))
; (after 'smartparens (diminish 'smartparens-mode))
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
;;(after 'company (diminish 'company-mode))
; (after 'elisp-slime-nav (diminish 'elisp-slime-nav-mode))
; (after 'git-gutter+ (diminish 'git-gutter+-mode))
; (after 'magit (diminish 'magit-auto-revert-mode))
; (after 'hs-minor-mode (diminish 'hs-minor-mode))
; (after 'color-identifiers-mode (diminish 'color-identifiers-mode))




;;; javascript stuff

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))







;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

(require 'auto-complete)
(global-auto-complete-mode t)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(sml/mode-width
   (if
       (eq powerline-default-separator
           (quote arrow))
       (quote right)
     (quote full)))
 '(sml/pos-id-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s" powerline-default-separator
                            (car powerline-default-separator-dir)))
                   (quote powerline-active1)
                   (quote powerline-active2))))
     (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s" powerline-default-separator
                            (cdr powerline-default-separator-dir)))
                   (quote powerline-active1)
                   nil)))
     (:propertize " " face sml/global))))
 '(sml/pre-id-separator
   (quote
    (""
     (:propertize " " face sml/global)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s" powerline-default-separator
                            (car powerline-default-separator-dir)))
                   nil
                   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s" powerline-default-separator
                            (cdr powerline-default-separator-dir)))
                   (quote powerline-active2)
                   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
