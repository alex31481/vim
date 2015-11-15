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

(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
