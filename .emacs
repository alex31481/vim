(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; initialize package
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.  Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install "iedit" and "magit"
(ensure-package-installed 'evil 'helm 'magit 'key-chord 'ample-theme 'linum-relative)

;; load themes
(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
;; pick ample flat
(enable-theme 'ample)

;; relatie-number
(linum-mode t)
(linum-on)
;;(linum-relative-enable-helm-support t)
(linum-relative-mode)

;; vim stuff
(require 'evil)
(evil-mode t)

;; normal key maps
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(define-key evil-normal-state-map ";" 'evil-ex)
;;(define-key evil-insert-state-map (kbd "C-s") 'save-buffer)
(define-key evil-insert-state-map (kbd "C-s")(lambda () (interactive) (evil-normal-state) (save-buffer)))


;; no bell
(setq visible-bell 1)




